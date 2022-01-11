from flask import Flask, request, render_template
import sys
import os
import requests

app = Flask(__name__)
service_name = ''
target_server_name = ''

# Routes 

# Healthcheck route
@app.route('/check')
def check():
    print('Entered healthcheck', file=sys.stderr)
    return 'Service [{}] is healthy'.format(service_name)

# Form route
@app.route('/form', methods=('GET', 'POST'))
def form():
    if request.method == 'GET':
        return render_template('form.html', service_name=service_name)
    elif request.method == 'POST':
        response = requests.get("http://{}:5000/get_users?name={}".format(target_server_name, request.form['user_name']))
        return render_template('result.html', users=response.text)

if __name__ == '__main__':
    service_name = os.getenv('SERVICE_NAME')
    target_server_name = os.getenv('TARGET_SERVER_NAME')
    app.run(host='0.0.0.0', debug=True, use_reloader=False)
