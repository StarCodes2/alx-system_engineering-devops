#!/usr/bin/python3
""" Function to count the number of specifie words in the title of all hot
    articles in a given subreddit."""
import requests


def count_words(subreddit, word_list, words_count={}, count=0, after=""):
    """ Prints the number of specified words in the titles of all hot
        articles of a given subreddit. """
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
        title = child.get("data").get("title").lower().split()
        for word in word_list:
            if word.lower() in title:
                count = len([t for t in title if t == word.lower()])
                if words_count.get(word.lower()) is None:
                    words_count[word.lower()] = count
                else:
                    words_count[word.lower()] += count

    if after is not None:
        count_words(subreddit, word_list, words_count, count, after)
    else:
        if len(words_count) == 0:
            return
        words_count = sorted(words_count.items(), key=lambda k: (-k[1], k[0]))
        for key, value in words_count:
            print("{}: {}".format(key, value))
