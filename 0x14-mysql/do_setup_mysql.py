#!/usr/bin/python3
""" Setup mysql on two servers using a .sql file. """
from fabric.api import put, sudo, env
from os.path import isfile

env.hosts = ["18.214.89.20", "52.203.53.113"]
env.user = "ubuntu"


def do_setup_mysql(sql_path):
    """ Uploads a sql file to two servers. """
    if isfile(sql_path) is False:
        return False

    file_name = sql_path.split("/")[-1]
    tmp = "/tmp/{}".format(file_name)
    if put(sql_path, tmp).failed is True:
        return False
    if sudo("cat {} | mysql -hlocalhost -uroot -p".format(tmp)).failed is True:
        return False
    if sudo("rm {}".format(tmp)).failed is True:
        return False
