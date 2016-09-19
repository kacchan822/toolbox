<!DOCTYPE html>
<html lang='ja'>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TOOLBOX.APTENODYTESFORSTERI.NET</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/style.css" rel="stylesheet">
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container">
    <div class="page-header">
    <a href="/"><h1>TOOLBOX<br><small>APTENODYTESFORSTERI.NET</small></h1></a>
    </div>
        {{!base}}
</div><!--container-->
<footer id="footer">
<p class="text-center"><a href="https://www.skatsuya.com/" target="_blank">managed by Katsuya SAITO, 2016.</a></p>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
% if defined('add_js'):
<script src="/static/js/{{add_js}}"></script>
% end
</body>
</html>
