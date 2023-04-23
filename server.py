from flask import Flask
from flask_cors import CORS

from ssh_commands import run_command_via_ssh

from os import popen

from env import *

app = Flask(__name__)
CORS(app)


@app.route('/', methods=['post', 'get'])
def home():
    return "Service Running"


@app.route('/restart/', methods=['post', 'get'])
def restart():
    ping_response = popen("ping -c 1 {}".format(host)).read().strip()
    if ping_failed in ping_response:
        return "Ping test to IP Address {} failed".format(host)
    else:
        run_command_via_ssh(run_command_via_ssh(host, user, password, reboot_command))
        return "Restarted"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
