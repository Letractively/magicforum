import bottle
import disqusapi as disqus
import json
shortname = 'magicmisteryforum'
api = disqus.DisqusAPI(open("key").read().strip())

@bottle.route('/')
def index():
    threads = api.forums.listThreads(forum=shortname, limit=100)
    print threads[0]
    return bottle.template('main.tpl', threads=threads, shortname=shortname)

@bottle.route('/new', method='POST')
def new():
    title = bottle.request.forms.get('title')
    thread = api.threads.create(forum=shortname, title = title)
    thread_id = thread.__dict__['response']['id']
    # Redirecting to /thread/thread_id doesn't work 
    # because threads take a few seconds to appear on the listing
    bottle.redirect('/')

@bottle.route('/thread/:id')
def thread(id):
    t = api.threads.details(thread=id)
    return bottle.template('thread.tpl', shortname=shortname, id=id, thread=t.__dict__['response'])

app = bottle.app()
app.catchall = False #Now most exceptions are re-raised within bottle.
bottle.run(host='184.82.108.14', port=80, app=app)
