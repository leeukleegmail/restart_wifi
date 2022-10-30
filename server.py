from flask import Flask
from flask_cors import CORS

from wifi_reset import restart_wifi

app = Flask(__name__)
CORS(app)


@app.route('/', methods=['post', 'get'])
def home():
    return "200"


@app.route('/restart/', methods=['post', 'get'])
def restart():
    restart_wifi()
    return "200"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
