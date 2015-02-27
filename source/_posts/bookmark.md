title: 书签栏小工具
date: 2014-10-11 21:24
tags: tools
categories: tools
---

我整理了一些我常常使用的标签在线工具
你可以复制javascript的字符串，新建一个标签，添加到收藏栏

###url2qr
自动转换当前页面为一个二维码，方便手机扫描访问。
<a class="bookmarklet" href="javascript: void(
(function() {var element = document.createElement('script');url='http://chart.lanbing.org/chart?&cht=qr&chld=|1&chs=240x240&chl='+location.href;element.id = 'forward';element.charset = 'utf-8',element.innerText='location.href=url';document.body.appendChild(element);})()
)">url2qr</a>

###定时关闭标签
<a class="bookmarklet" href="
javascript:str='whatever';var f='location.href=str'; setTimeout(f, 1000*prompt('当前标签关闭时间(s)'));
">定时关闭</a>

###GetFlv
支持y2b和优酷等，比较少用。
<a class="bookmarklet" href='
javascript:window.location.href='http://flvgo.com/download?url='+encodeURIComponent(location.href);
'>GetFlv</a>

###WpFill
自动填充wordpress的回复表单，以后就不用填用户名、邮箱和网址了(这个需要先修改URL内容)
<a class="bookmarklet" href='
javascript:(function(){document.getElementById('author').value='yantze';document.getElementById('email').value='yantze@126.com';document.getElementById('url').value='http://vastiny.com';document.getElementById("comment").focus();})()
'>wpFill</a>

###Send to Kindle
可以直接去klip.me里面添加你自己的链接，自动发送到kindle
[klip.me](http://www.klip.me/sendtokindle/)

###Gitignore.io
gernerate the gitignore file for special soft/language.
生成gitignore文件，比如输入xcode，自动添加各种build等要忽略的gitignore文件
[gitignore.io](https://www.gitignore.io)
