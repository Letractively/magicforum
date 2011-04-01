import bottle
import disqusapi as disqus
import json
shortname = 'forum2'
key = open("key").read().strip()
api = disqus.DisqusAPI(key)
url = "http://foro.netmanagers.com.ar:81"

@bottle.route('/', method='GET')
def index():
    msg = bottle.request.GET.get('msg', '')
    return bottle.template('main.tpl', shortname=shortname, msg=msg, key=key)

@bottle.route('/listthreads', method='GET')
def threads():
    threads = api.threads.list(forum=shortname, limit=25)
    return json.dumps([t for t in threads])

@bottle.route('/new', method='POST')
def new():
    title = bottle.request.forms.get('title', None)
    if not title:
        bottle.redirect('/?msg=Missing%20Thread%20Name')
        return
    thread = api.threads.create(forum=shortname, title = title, identifier = title)
    thread_id = thread.__dict__['response']['id']
    #api.posts.create(thread=thread_id, message="Post about %s here!"%title)
    # Redirecting to /thread/thread_id doesn't work 
    # because threads take a few seconds to appear on the listing
    #bottle.redirect('/thread/%s'%thread_id)
    bottle.redirect('/')

@bottle.route('/thread/:id')
def thread(id):
    t = api.threads.details(thread=id)
    return bottle.template('thread.tpl', shortname=shortname, id=id, thread=t.__dict__['response'], url=url)

@bottle.route('/static/:path#.+#')
def server_static(path):
    return bottle.static_file(path, root='./static')

app = bottle.app()
app.catchall = False #Now most exceptions are re-raised within bottle.
bottle.run(host='184.82.108.14', port=81, app=app)
