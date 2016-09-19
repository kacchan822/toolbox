% rebase('base.tpl')
<section>
    <h2>Tools Index<br><small>公開しているツールのインデックスページです。</small></h2>
    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
        <div class="list-group">
            % for data in data:
            <a href="{{data['page_uri']}}" class="list-group-item">
                <h4 class="list-group-item-heading">{{data['page_name']}}</h4>
                <p class="list-group-item-text">{{data['page_description']}}</p>
                <p class="list-group-item-text text-right">{{data['page_version']}}</p>
            </a>
            % end
        </div></div>
        <div class="col-sm-8">
            <p>公開しているツールのソースコードは、<a href="https://github.com/kacchan822/toolbox">Github上で公開</a>しています。</p>
            <p>公開しているツールの作成には、Python3、bottleを使用しています。</p>
            <p>Password Generatorのパスワードのよみがな・Phonetic Code生成には、拙作パッケージの<a href="https://pypi.python.org/pypi/a2pcej">a2pcej</a>を使用しています。</p>
        </div>
        <div class="col-sm-4">
            <a href="http://bottlepy.org/"><img class="img-responsive" src="/static/img/bottle_logo.png"></a>
            <a href="https://www.python.org/"><img class="img-responsive"  src="/static/img/python_logo.png"></a>
        </div>
    </div>
</section>
