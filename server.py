from flask import Flask
from flask_cors import CORS

from wifi_reset import restart_wifi

from os import popen

from env import host, ping_failed

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
        restart_wifi()
        return "Restarted"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
