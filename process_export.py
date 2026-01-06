#!/usr/bin/env python3
"""
Script para procesar el export SQL y reemplazar los ownerIds con el ID del usuario del VPS
"""

import re
import sys

# ID del usuario en el VPS (josemas68@gmail.com)
VPS_USER_ID = 'cmk1oprln0001ovzwvl6wuz54'

# IDs de usuarios locales que necesitan ser reemplazados
LOCAL_USER_IDS = [
    'cmju3r7x40001jynhiqbwsno4',  # Tu usuario local
    'cmjw0e9tf0000pawbguthtiyz',  # jose@foodzinder.com
    'owner_001',                   # Owner del seed
    'owner_002',                   # Owner 2 del seed
    'admin_001',                   # Admin del seed
]

def process_sql_file(input_file, output_file):
    """Procesa el archivo SQL reemplazando los ownerIds"""

    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # Reemplazar todos los ownerIds locales con el ID del VPS
    for local_id in LOCAL_USER_IDS:
        content = content.replace(f"'{local_id}'", f"'{VPS_USER_ID}'")

    # Escribir el archivo procesado
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"OK Archivo procesado correctamente")
    print(f"   Input:  {input_file}")
    print(f"   Output: {output_file}")
    print(f"   Todos los restaurantes ahora pertenecen a: {VPS_USER_ID}")

if __name__ == '__main__':
    input_file = r'c:\Users\Jose\foodzinder-web\export_restaurants.sql'
    output_file = r'c:\Users\Jose\foodzinder-web\import_restaurants_vps.sql'

    process_sql_file(input_file, output_file)
