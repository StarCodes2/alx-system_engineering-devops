#!/usr/bin/python3
from fabric.api import get, env

env.hosts = ["54.88.33.51"]
env.user = "ubuntu"


def do_getfile(myfile):
    file_name = myfile.split("/")[-1]
    if get("{}".format(myfile), "{}".format(file_name)).failed is True:
        return False
    return True
