<head>
  <link rel="stylesheet" href="/static/bluetrip/css/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/static/bluetrip/css/print.css" type="text/css" media="print" />
  <!--[if IE]>
    <link rel="stylesheet" href="/static/bluetrip/css/ie.css" type="text/css" media="screen, projection" />
  <![endif]-->
  <link rel="stylesheet" href="/static/bluetrip/css/style.css" type="text/css" media="screen, projection" />
<title>Magical Mistery Forum</title>
</head>
<body style="width: 860px; margin: auto">
<h1>Magical Mistery Forum</h1>
<div>
%if msg: 
    <div class="error">
    {{msg}}
    </div>
%end
<form method="POST" action="/new">
<b>NEW THREAD</b>
<input type=text name=title>
<button class="submit">Create</button><br>
<span class="small">When you create a thread, it may take a minute to appear on the list.</span>
</div>
</hr>
<div>
<script type="text/javascript" src="http://magicmisteryforum.disqus.com/combination_widget.js?num_items=5&hide_mods=0&color=blue&default_tab=people&excerpt_length=200"></script><a href="http://disqus.com/">Powered by Disqus</a>
</div>

% for t in threads:
    %if t['title'].startswith('http://'): continue
    <div class="large" style="border: 1px solid lightgray; margin: 1em; background-color: lightgreen; padding:1em;">
    <a href="/thread/{{t['id']}}">{{t['title']}}</a>  [ <a href="/thread/{{t['id']}}#disqus_thread" data-disqus-identifier="{{t['id']}}">#</a>]
    <div class="small">
      <small>{{t['likes']}} likes -- {{t['dislikes']}} dislikes -- {{t['createdAt']}}</small>
    </div>
    </div>
% end
<hr>
<center>(c) Roberto Alsina -- <a href="http://magicforum.googlecode.com">http://magicforum.googlecode.com</a></center>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = '{{shortname}}'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
</script>
</body>