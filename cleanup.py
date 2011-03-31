#!/usr/bin/python2.6

import disqusapi as disqus
shortname = 'forum2'
api = disqus.DisqusAPI(open("key").read().strip())
for t in api.threads.list(forum=shortname, limit=100):
    api.threads.remove(thread=t['id'])
for t in api.posts.list(forum=shortname, limit=100):
    api.posts.remove(post=t['id'])

t = "Feel free to create threads or post comments here."
api.threads.create(forum=shortname, title=t, identifier=t)
