from flask import Flask
import os
app = Flask(__name__)

@app.route("/")
def hello():
	env_name = os.getenv('FLASK_ENV', "Please set FLASK_ENV")
	print("env_name: ", env_name)
	return env_name

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=80)

