<head>
  <link rel="stylesheet" href="/static/bluetrip/css/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/static/bluetrip/css/print.css" type="text/css" media="print" />
  <!--[if IE]>
    <link rel="stylesheet" href="/static/bluetrip/css/ie.css" type="text/css" media="screen, projection" />
  <![endif]-->
  <link rel="stylesheet" href="/static/bluetrip/css/style.css" type="text/css" media="screen, projection" />
<title>{{thread['title']}}</title>
</head>
<body style="width: 860px; margin: auto">
<h2>{{thread['title']}}</h2>
<hr>
<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_shortname = '{{shortname}}';
    var disqus_identifier = '{{id}}';
//    var disqus_url = '{{url}}/thread/{{id}}';
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>