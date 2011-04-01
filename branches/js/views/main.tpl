<head>
  <link rel="stylesheet" href="/static/bluetrip/css/screen.css" type="text/css" media="screen, projection" />
  <link rel="stylesheet" href="/static/bluetrip/css/print.css" type="text/css" media="print" />
  <!--[if IE]>
    <link rel="stylesheet" href="/static/bluetrip/css/ie.css" type="text/css" media="screen, projection" />
  <![endif]-->
  <link rel="stylesheet" href="/static/bluetrip/css/style.css" type="text/css" media="screen, projection" />
  <script type="text/javascript" src="/static/jx.js"></script>
  <script type="text/javascript" src="/static/accordion.js"></script>
<style type="text/css">
* {
	margin:0;
	padding:0;
	list-style:none;
}
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	margin:10px;
}

#basic-accordian{
	border:5px solid #EEE;
	padding:5px;
}

.accordion_headings{
	padding:5px;
	background:#99CC00;
	color:#FFFFFF;
	border:1px solid #FFF;
	cursor:pointer;
	font-weight:bold;
}

.accordion_headings:hover{
	background:#00CCFF;
}

.accordion_child{
	padding:15px;
	background:#EEE;
}

.header_highlight{
	background:#00CCFF;
}

</style>

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


<div id="basic-accordian" >
<div id="threads-header" class="accordion_headings header_highlight" >Threads</div>
<div id="threads-content" style="height: 800px; overflow: auto;"></div>

<div id="discussion-header" class="accordion_headings header_highlight" >Discussion</div>
<div id="discussion-content">

<iframe id="thread_frame" style="width: 100%; height: 650px;">
</iframe>

</div>
</div>

<hr>

<script type="text/javascript">
jx.load("/listthreads",function(data){
var threads = eval(data);
var tdiv = document.getElementById('threads-content');
tdiv.innerHTML = '' ;
for (i in threads) {
    var t = threads[i];
    if ( t['identifiers']) {
      if (t['identifiers'][0] == t['title']) {
        tdiv.innerHTML += '<div class="large" style="border: 1px solid lightgray; margin: 1em; background-color: lightgreen; padding:1em;"><a href="javascript:update_thread('+t['id']+')">'+t['title']+'</a> [ <a href="#disqus_thread" data-disqus-identifier="'+t['id']+'">#</a>]</div>';
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

var update_thread = function(tid) {
    t_frame=document.getElementById('thread_frame');
    t_frame.src = '/thread/'+tid;
    document.getElementById('discussion-header').onclick();
};
new Accordian('basic-accordian',2,'header_highlight');
document.getElementById('threads-header').onclick();

</script>
<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
</body>
