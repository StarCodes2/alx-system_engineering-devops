#!/usr/bin/python3
""" Returns information about an empolyee's TODO list progress using employee
id """
import json
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    todos = requests.get(url + "todos/", params={"userId": argv[1]}).json()
    emp = requests.get(url + "users/{}".format(argv[1])).json()
    user = emp.get("username")

    with open("{}.json".format(argv[1]), "w", newline="") as jsonfile:
        json.dump({argv[1]: [{
                "task": todo.get("title"),
                "completed": todo.get("completed"),
                "username": user
            } for todo in todos]}, jsonfile)
