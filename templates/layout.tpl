<!DOCTYPE html>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>{{ title }}</title>
<link href="/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
    jax: ["input/TeX", "output/HTML-CSS"],
    extensions: ["tex2jax.js"],
    tex2jax: {
        inlineMath: [ ['$', '$'] ],
        displayMath: [ ['$$','$$'] ]
    },
"HTML-CSS": { availableFonts: ["TeX"] }
});
</script>
<script type="text/javascript"
src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
<div id="container">
<h1 id="page_title"><a href="index.html">{{ title }}</a></h1>
{{ content }}
</div>
</body></html>
