from flask import Flask, request
from mysql.connector import connect, Error
import sys
import os

app = Flask(__name__)
connection = []
service_name = ""
database_host = ""

# Routes 

# Healthcheck route
@app.route("/check")
def check():
    print("Entered healthcheck", file=sys.stderr)
    return "Service [{}] is healthy".format(service_name)

# User retrieval route
@app.route('/get_users')
def get_users():
    name = request.args.get('name') 
    return " | ".join(get_users_from_name(name))

# Helper functions

# Get all users given a name
def get_users_from_name(name):
    cursor = []
    accumulator = []
    
    try:
        query = "SELECT * FROM user WHERE name = \"{}\"".format(name)
        cursor = connection.cursor()
        cursor.execute(query)

        row = cursor.fetchone()

        while row is not None:
            accumulator.append(join_tuple_elements(row))
            row = cursor.fetchone()

    except Error as e:
        print(e)

    finally:
        cursor.close()

    return accumulator

# Join elements in tuple in a single string, 
# regardless of the element type
def join_tuple_elements(tup): 
    return '-'.join(str(element) for element in tup)

# Populate the database

def perform_fixtures(filename):
    fd = open(filename, 'r')
    sqlFile = fd.read()
    fd.close()
    sqlCommands = sqlFile.split(';')

    cursor = connection.cursor()
    
    for command in sqlCommands:
        if command.strip() != '':
            cursor.execute(command)

    cursor.close()

if __name__ == "__main__":
    service_name = os.getenv("SERVICE_NAME")
    database_host = os.getenv("DATABASE_HOST")

    connection = connect(user='root',
                  password='password',
                  host=database_host,
                  database='db')
    
    perform_fixtures('fixtures.sql')
    
    connection.commit()

    app.run(host="0.0.0.0", debug=True, use_reloader=False)
