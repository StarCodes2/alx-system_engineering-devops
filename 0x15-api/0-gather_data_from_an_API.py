#!/usr/bin/python3
""" Returns information about an empolyee's TODO list progress using employee
id """
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    todos = requests.get(url + "todos/", params={"userId": argv[1]}).json()
    emp = requests.get(url + "users/{}".format(argv[1])).json()

    done = [d.get("title") for d in todos if d.get("completed") is True]
    print("Employee {} is done with tasks ({}/{}):".format(
        emp.get("name"), len(done), len(todos)))

    for d in done:
        print("\t {}".format(d))
