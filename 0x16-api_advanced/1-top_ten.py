#!/usr/bin/python3
""" function that queries the Reddit API and prints the titles of the first
    10 hot posts listed for a given subreddit. """
import requests


def top_ten(subreddit):
    """ Returns the titles of the first 10 hot posts listed for a given
        subreddit. """
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {
        "User-Agent": "linux:api.request.red:v1.0.0 (by /u/Muted_Reason6144)"
    }
    param = {
        "count": 0,
        "after": "",
        "limit": 10
    }
    res = requests.get(url, headers=headers, params=param,
                       allow_redirects=False)
    if res.status_code != 200:
        print("None")
        return

    result = res.json().get("data")
    for p in result.get("children"):
        print(p.get("data").get("title"))
