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
    <h2>Crypt Passwords<br><small>「パスワードの暗号化」・「暗号化されたパスワードと平文パスワードの一致確認」ができます。</small></h2>
    <div class="jumbotron">
        <form class="form-horizontal" id="crypt_password_form">
        <div class="form-group">
            <div class="btn btn-default line-add"><span class="glyphicon glyphicon-plus"></span></div>
            <div class="btn btn-default line-del"><span class="glyphicon glyphicon-minus"></span></div>
        </div>
        <table class="table table-hover">
            <thead>
                <tr id="t_head" class="text-center">
                    <td class="col-md-4">パスワード（平文）</td>
                    <td class="col-md-5">パスワード（暗号化）</td>
                    <td class="col-md-3">暗号化方式</td>
                </tr>
            </thead>
            <tbody id="t_body">
                <tr>
                    <td>
                        <input type="text" class="form-control plain_password" placeholder="パスワード(平文)" name="plain_password" onclick="select()">
                    </td>
                    <td>
                        <input type="text" class="form-control crypted_password" placeholder="パスワード（暗号化）" name="crypted_password" onclick="select()">
                    </td>
                    <td>
                        <select class="form-control" id="crypt_method" name="crypt_method">
                            <option class="crypt_method0" value="0" selected="selected">---</option>
                            <option class="crypt_method1" value="1">MD5-CRYPT($1$で始まる形式)</option>
                            <option class="crypt_method5" value="5">SHA256-CRYPT($5$で始まる形式)</option>
                            <option class="crypt_method6" value="6">SHA512-CRYPT($6$で始まる形式)</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="form-group">
            <div class="btn btn-default line-add"><span class="glyphicon glyphicon-plus"></span></div>
            <div class="btn btn-default line-del"><span class="glyphicon glyphicon-minus"></span></div>
        </div>
        <div class="form-group pull-right">
            <div class="btn btn-danger" id="form_reset">リセット</div>
            <div class="btn btn-primary" id="crypt_password">「パスワード暗号化 / 一致チェック」を実行</div>
        </div>
        </form>
    </div>
    <p><b>パスワードの暗号化する</b>ときは、「パスワード（平文）」の欄に暗号化したいパスワードを入力してください。<br>暗号化方式を指定する場合は、プルダウンから選択してください。選択されなかった場合は、SHA512-CRYPTで暗号化されます。</p>
     <p><b>パスワード（平文）とパスワード（暗号化）のペアが正しいか確認する</b>ときは、「パスワード（平文）」と「パスワード（暗号化）」の欄を入力してください。<br>暗号化方式を指定する必要はありません（暗号化されたパスワードから認識します）。一致しなかった場合は、行背景が赤くなります。</p>
     <p>「パスワード（暗号化）」の欄に入力があると、「<b>パスワード（平文）とパスワード（暗号化）のペアが正しいか確認する</b>」動作となります。</p>
    </section>
</div><!--container-->
<footer id="footer">
<p class="text-center"><a href="https://www.skatsuya.com/" target="_blank">managed by Katsuya SAITO, 2016.</a></p>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="/static/js/cryptpw.js"></script>
</body>
</html>
