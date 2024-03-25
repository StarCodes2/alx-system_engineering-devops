#!/usr/bin/python3
""" Returns information about an empolyee's TODO list progress using employee
id """
import csv
import requests
from sys import argv


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    todos = requests.get(url + "todos/", params={"userId": argv[1]}).json()
    emp = requests.get(url + "users/{}".format(argv[1])).json()
    user = emp.get("username")

    with open("{}.csv".format(argv[1]), "w", newline="") as csvfile:
        write = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        [write.writerow(
            [argv[1], user, todo.get("completed"), todo.get("title")]
         ) for todo in todos]
