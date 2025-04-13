from flask import Flask, render_template, request, jsonify
import os
import subprocess

app = Flask(__name__)

sync_process = None

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/start-sync', methods=['POST'])
def start_sync():
    global sync_process
    if sync_process is None or sync_process.poll() is not None:
        sync_process = subprocess.Popen(
            ['./scripts/sync-forks.sh'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        return jsonify({'message': 'Sync started!'})
    return jsonify({'message': 'Sync is already running!'})

@app.route('/sync-status', methods=['GET'])
def sync_status():
    global sync_process
    if sync_process is None:
        return jsonify({'status': 'Not started'})
    if sync_process.poll() is None:
        return jsonify({'status': 'Running'})
    output, error = sync_process.communicate()
    return jsonify({'status': 'Completed', 'output': output, 'error': error})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)