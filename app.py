from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Working fine bruh!'


if __name__ == "__LUCIFER__":
    app.run()
