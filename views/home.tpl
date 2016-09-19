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
        <p>公開しているツールのソースコードや、このページを生成しているソースコードは、
            <a href="https://github.com/kacchan822/toolbox">Github上で公開</a>しています。</p>
        </div>
        <div class="col-sm-4">
            <a href="http://bottlepy.org/"><img class="img-responsive" src="/static/img/bottle_logo.png"></a>
            <a href="https://www.python.org/"><img class="img-responsive"  src="/static/img/python_logo.png"></a>
        </div>
    </div>
</section>
