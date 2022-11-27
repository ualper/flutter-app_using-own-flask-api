# flutter-app_using-own-flask-api


Once installed, open up your terminal or cmd to install flask.

	pip install Flask 
	or 
	brew install Flask (for mac)


Run : just run python file using.

	python FlaskApi.py

After that this will show the local http adress.

	 * Serving Flask app 'FlaskApi'
	 * Debug mode: off
	WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
	 * Running on http://127.0.0.1:5000
	Press CTRL+C to quit

By default, the port is 5000. After that you can reach created api with requests.

When flask app running, api is reachable with using get requests.

Access Characters : http://127.0.0.1:5000/character/

Access a single character : http://127.0.0.1:5000/character/10
