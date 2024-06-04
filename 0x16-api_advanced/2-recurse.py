#!/usr/bin/python3
""" Function to query and return a list of all hot articles in a
    given subreddit."""
import requests


def recurse(subreddit, hot_list=[], count=0, after=""):
    """ Returns the titles of all hot articles of a given subreddit. """
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    param = {
        "count": count,
        "after": after,
        "limit": 100
    }
    headers = {
        "User-Agent": "linux:api.request.red:v1.0.0 (by /u/Muted_Reason6144)"
    }
    res = requests.get(url, headers=headers, params=param,
                       allow_redirects=False)
    if res.status_code != 200:
        return None

    data = res.json().get("data")
    count += data.get("dist")
    after = data.get("after")
    for child in data.get("children"):
        hot_list.append(child.get("data").get("title"))

    if after is not None:
        return recurse(subreddit, hot_list, count, after)
    return hot_list
