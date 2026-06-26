from flask import Flask, request, jsonify
import json
import os

app = Flask(__name__)
KEYS_FILE = '/home/ubuntu/AimHub/keys.json'
API_SECRET = 'NyxSecretAPI2026'

def load_keys():
    if not os.path.exists(KEYS_FILE):
        return {}
    with open(KEYS_FILE, 'r') as f:
        return json.load(f)

@app.route('/checkkey', methods=['POST'])
def checkkey():
    data = request.json
    if not data or data.get('secret') != API_SECRET:
        return jsonify({'valid': False, 'error': 'Unauthorized'}), 401
    key = data.get('key', '')
    keys = load_keys()
    for user_id, v in keys.items():
        if v['key'] == key:
            return jsonify({'valid': True, 'user': v['username']})
    return jsonify({'valid': False})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
