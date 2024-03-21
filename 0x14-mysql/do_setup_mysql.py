#!/usr/bin/python3
""" Setup mysql on two servers using a .sql file. """
from fabric.api import put, sudo, env
from os.path import isfile

env.hosts = ["54.88.33.51", "100.26.50.21"]
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
