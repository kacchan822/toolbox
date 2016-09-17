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

    <section>
    <h2>Password Generator<br><small>パスワードを自動生成して、パスワードの暗号化文字列やよみがなを表示します。</small></h2>
    <div class="jumbotron">
        <form class="form-horizontal" id="generate_password_form">
            <div class="form-group">
        		<label class="col-sm-2 control-label" for="plain_password">パスワード（平文）</label>
                <div class="col-sm-4">
    		        <input type="text" class="form-control" id="plain_password" placeholder="パスワード(平文)" name="plain_password" value="{{plain_password}}" onclick="select()">
                </div>
            </div>
            <div class="form-group">
        		<label class="col-sm-2 control-label" for="crypted_password">パスワード(暗号化)</label>
                <div class="col-sm-10">
    		        <input type="text" class="form-control" id="crypted_password" placeholder="パスワード（暗号化）" name="crypted_password" value="{{crypted_password}}" onclick="select()">
                </div>
            </div>
            <div class="form-group">
        		<label class="col-sm-2 control-label" for="yomigana">よみがな</label>
                <div class="col-sm-10">
    		        <input type="text" class="form-control" id="yomigana" placeholder="よみがな"  name="yomigana" value="{{yomigana}}" onclick="select()">
                </div>
            </div>
            <div class="form-group">
        		<label class="col-sm-2 control-label" for="phonetic_code">Phonetic Code</label>
                <div class="col-sm-10">
    		        <input type="text" class="form-control" id="phonetic_code" placeholder="Phonetic code"  name="phonetic_code" value="{{phonetic_code}}" onclick="select()">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="btn btn-primary pull-right" id="generate_password">別のパスワードを自動生成</div>
                </div>
            </div>
        </form>

        <div class="row">
        <div class="col-sm-9 col-sm-offset-3">
        <p class="text-center">パスワード生成オプション</p>
        <form class="form-horizontal" id="password_generate_options">
            <div class="form-group">
                <label class="col-sm-4 control-label" for="password_length">パスワード桁数:</label>
                <div class="col-sm-2">
		            <input type="text" class="form-control" id="password_length" name="password_length" value="8">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="password_rule">パスワード生成ルール:</label>
                <div class="col-sm-8">
                    <select class="form-control" name="password_rule">
                        <option id="password_rule1" value="1">アルファベットのみ</option>
                        <option id="password_rule2" value="2">アルファベット(大文字を含まない)のみ</option>
                        <option id="password_rule3" value="3">数字のみ</option>
                        <option id="password_rule4" value="4">アルファベット・数字</option>
                        <option id="password_rule5" value="5">アルファベット(大文字を含まない)・数字</option>
                        <option id="password_rule6" value="6" selected="selected">アルファベット・数字・記号('=', '@', '#', '?', '$')</option>
                        <option id="password_rule7" value="7" selected="selected">アルファベット(大文字を含まない)・数字・記号('=', '@', '#', '?', '$')</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="crypt_method">パスワードの暗号化方式:</label>
                <div class="col-sm-8">
                    <select class="form-control" name="crypt_method">
                        <option id="crypt_method1" value="1">MD5-CRYPT($1$で始まる形式)</option>
                        <option id="crypt_method5" value="5">SHA256-CRYPT($5$で始まる形式)</option>
                        <option id="crypt_method6" value="6" selected="selected">SHA512-CRYPT($6$で始まる形式)</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="yomigana_delimiter">よみがなの区切り文字:</label>
                <div class="col-sm-2">
		            <input type="text" class="form-control" id="yomigana_delimiter" name="yomigana_delimiter" value="・">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="yomigana_sign">よみがなの大文字付記:</label>
                <div class="col-sm-4">
		            <input type="text" class="form-control" id="yomigana_sign" name="yomigana_sign" value="（大文字）">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="phonetic_code_delimiter">Phonetic Codeの区切り文字:</label>
                <div class="col-sm-2">
		            <input type="text" class="form-control" id="phonetic_code_delimiter" name="phonetic_code_delimiter" value="/">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" for="phonetic_code_sign">Phonetic Codeの大文字付記:</label>
                <div class="col-sm-4">
		            <input type="text" class="form-control" id="phonetic_code_sign" name="phonetic_code_sign" value="(CAP)">
                </div>
            </div>
        </form>
        <small>注）パスワード文字数は、最大100文字まで対応しています。それ以上を指定すると100文字までに切り詰められます。</small>
        </div><!--col --></div><!-- row -->

	</div>
    </section>

</div><!--container-->
<footer id="footer">
<p class="text-center"><a href="https://www.skatsuya.com/" target="_blank">managed by Katsuya SAITO, 2016.</a></p>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/static/js/tools.js"></script>
</body>
</html>
