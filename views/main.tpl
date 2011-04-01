<head>
  <link rel="stylesheet" href="/static/bluetrip/css/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/static/bluetrip/css/print.css" type="text/css" media="print" />
  <!--[if IE]>
    <link rel="stylesheet" href="/static/bluetrip/css/ie.css" type="text/css" media="screen, projection" />
  <![endif]-->
  <link rel="stylesheet" href="/static/bluetrip/css/style.css" type="text/css" media="screen, projection" />
  <script type="text/javascript" src="/static/jx.js"></script>
<title>Magical Mistery Forum</title>
</head>
<body style="width: 860px; margin: auto">
<h1>Magical Mistery Forum</h1>
%if msg: 
    <div class="error">
    {{msg}}
    </div>
%end
</hr>
<div>

<script type="text/javascript" src="http://magicmisteryforum.disqus.com/combination_widget.js?num_items=5&hide_mods=0&color=blue&default_tab=people&excerpt_length=200"></script><a href="http://disqus.com/">Powered by Disqus</a>
</div>

<div>
<form method="POST" action="/new">
<span class="loud">New Thread Title:</b>
<input type=text name=title>
<input type="submit" value="Create">
<div class="error">When you create a thread, it may take a minute to appear on the list.</br>
All threads and posts will be deleted every hour, this is a test site only
</div>
</div>
<div id="threads">
</div>
<hr>

<script type="text/javascript">
jx.load("/listthreads",function(data){
var threads = eval(data);
var tdiv = document.getElementById('threads');
tdiv.innerHTML = '' ;
for (i in threads) {
    var t = threads[i];
    if ( t['identifiers']) {
      if (t['identifiers'][0] == t['title']) {
        tdiv.innerHTML += '<div class="large" style="border: 1px solid lightgray; margin: 1em; background-color: lightgreen; padding:1em;"><a href="/thread/'+t['id']+'">'+t['title']+'</a> [ <a href="/thread/'+t['id']+'#disqus_thread" data-disqus-identifier="'+t['id']+'">#</a>]</div>';
      };
    };
};
    var disqus_shortname = '{{shortname}}'; 
    (function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());

});


</script>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
</body>
