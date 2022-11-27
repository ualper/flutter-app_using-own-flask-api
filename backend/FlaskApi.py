from flask import *
import json
# using restfull resuest calls
import requests

# Flask app
app = Flask(__name__)

# disable jsonify auto sorting elements
app.config['JSON_SORT_KEYS'] = False

# -------------------------------------------------------------------------------------- 
# Requested data List stored in Characters from rickandmorty api
Characters = []
# Request URL for Characters from rickandmorty api
URLofCharacters = "https://rickandmortyapi.com/api/character/"
# -------------------------------------------------------------------------------------- 
def ListFromApi(apiURL):
    # Making a get request
    response = requests.get(apiURL)
    # Get first page of characters from api
    characters = json.loads(response.text)['results']
    return characters
# --------------------------------------------------------------------------------------
# store first page characters from api
Characters = ListFromApi(URLofCharacters)
# --------------------------------------------------------------------------------------
@app.route('/', methods=['GET'])
def home_page():
    welcomeMessage = {'Page': 'Home', 'Message': 'RICK AND MORTY API'}
    return welcomeMessage
# --------------------------------------------------------------------------------------
@app.route('/character/', methods=['GET'])
def returnCharacters():
    return jsonify(Characters)
# --------------------------------------------------------------------------------------
@app.route('/character/<int:id>/', methods=['GET'])
def returnMatched(id):
    characterFromID = [character for character in Characters if character['id'] == id]
    # return make_response(dumps(characterFromID))
    return jsonify(characterFromID)
# --------------------------------------------------------------------------------------

if __name__ == '__main__':
    app.run()