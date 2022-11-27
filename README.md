# flutter-app_using-own-flask-api
Flask is one of the most popular web application frameworks written in Python. It is a microframework designed for an easy and quick start. Extending with tools and libraries adds more functionality to Flask for more complex projects.


Prerequisites
    * Installed Python 2.7 or Python 3

Step 1: Install Virtual Environment

    Linux : sudo apt install python-virtualenv
    Mac : sudo python2 -m pip install virtualenv

Step 2: Create an Environment

    mkdir <project name> 
    cd <project name>

    Linux: python3 -m venv <name of environment>
    Mac : python3 -m venv <name of environment>

Step 3: Activate the Environment

    . <name of environment>/bin/activate

Step 4: Install Flask
	
    pip install Flask

Step 5: Test the Development Environment
	
    python FlaskApi.py or flask run

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
