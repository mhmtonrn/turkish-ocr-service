from flask import Flask, request, jsonify

from ExtractText import ExtractText

app = Flask(__name__)


@app.route('/')
def hello_world():  # put application's code here
    print("init")
    return jsonify(msg="UP")


@app.route('/loadImage', methods=['POST'])
def login():
    content = request.get_json(silent=True)
    print(content)
    ex = ExtractText()
    result = ex.extract(content["image"])
    return jsonify(text=result)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
