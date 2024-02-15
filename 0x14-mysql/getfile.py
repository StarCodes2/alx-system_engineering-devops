#!/usr/bin/python3
from fabric.api import get, env

env.hosts = ["18.214.89.20"]
env.user = "ubuntu"


def do_getfile(myfile):
    file_name = myfile.split("/")[-1]
    if get("{}".format(myfile), "{}".format(file_name)).failed is True:
        return False
    return True
