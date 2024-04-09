#!/usr/bin/python3
""" Function that sends a request to get the number of subscribers of a
    given Reddit subreddit. """
import requests


def number_of_subscribers(subreddit):
    """Returns the total number of reddit subscribers on a given subreddit."""
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    header = {
        "User-Agent": "linux:api.request.red:v1.0.0 (by /u/Muted_Reason6144)"
    }
    response = requests.get(url, headers=header, allow_redirects=False)
    if response.status_code == 404:
        return 0

    data = response.json().get("data")
    return data.get("subscribers")
