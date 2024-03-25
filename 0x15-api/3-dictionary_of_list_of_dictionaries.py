#!/usr/bin/python3
""" Returns information about an empolyee's TODO list progress using employee
id """
import json
import requests


if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users").json()

    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump({u.get("id"): [{
                "username": user.get("username"),
                "task": todo.get("title"),
                "completed": todo.get("completed")
            } for todo in requests.get(url + "todos",
                                       params={"userId": u.get("id")}).json()]
            for u in users}, jsonfile)
