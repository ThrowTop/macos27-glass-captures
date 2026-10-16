#!/usr/bin/env python3
"""Best-effort CI TCC grant, with schema and outcome recorded in env.txt."""
import os
import sqlite3
import subprocess
import sys
import time

bundle = sys.argv[1]
exe = sys.argv[2]
locations = [
    os.path.expanduser('~/Library/Application Support/com.apple.TCC/TCC.db'),
    '/Library/Application Support/com.apple.TCC/TCC.db',
]
values = {
    'service': 'kTCCServiceScreenCapture',
    'client_type': 0,
    'auth_value': 2,
    'auth_reason': 4,
    'auth_version': 1,
    'indirect_object_identifier_type': 0,
    'indirect_object_identifier': 'UNUSED',
    'flags': 0,
    'last_modified': int(time.time()),
}

for location in locations:
    print(f'TCC path: {location}; exists={os.path.exists(location)}')
    if not os.path.exists(location):
        continue
    # sqlite3 CLI through sudo is needed for the system database on hosted images.
    prefix = ['sudo', '-n'] if location.startswith('/Library/') else []
    schema = subprocess.run(prefix + ['sqlite3', location, 'PRAGMA table_info(access);'],
                            text=True, capture_output=True)
    print(f'schema exit={schema.returncode}: {schema.stdout.strip()} {schema.stderr.strip()}')
    if schema.returncode:
        continue
    columns = [line.split('|')[1] for line in schema.stdout.splitlines() if '|' in line]
    for client, client_type in [(bundle, 0), (exe, 1)]:
        row = dict(values, client=client, client_type=client_type)
        selected = [name for name in columns if name in row]
        if not {'service', 'client', 'client_type', 'auth_value'} <= set(selected):
            print('required TCC columns unavailable; skipped')
            continue
        quoted = ','.join('?' for _ in selected)
        sql = f"INSERT OR REPLACE INTO access ({','.join(selected)}) VALUES ({quoted})"
        # sqlite3 CLI has no parameter API; quote all values with SQLite's quote rules.
        def literal(value):
            if isinstance(value, int):
                return str(value)
            return "'" + value.replace("'", "''") + "'"
        statement = f"INSERT OR REPLACE INTO access ({','.join(selected)}) VALUES ({','.join(literal(row[k]) for k in selected)});"
        result = subprocess.run(prefix + ['sqlite3', location, statement], text=True, capture_output=True)
        print(f'grant client={client} type={client_type} exit={result.returncode}: {result.stderr.strip()}')
    subprocess.run(['killall', 'tccd'], text=True, capture_output=True)
