title: 书签栏的妙用
date: 2014-10-11 21:24
tags: tools
categories: tools
---

我整理了一些我常常使用的标签在线工具
你可以复制javascript的字符串，新建一个标签，添加到收藏栏

###Url2qr
自动转换当前页面为一个二维码，方便手机扫描访问。
<a href="
javascript:(function(){location.href='http://chart.lanbing.org/chart?&cht=qr&chld=|1&chs=240x240&chl="+location.href;})()
'>url2qr</a>

###定时关闭标签
<a href="
javascript:var str='';var f='location.href=location.search'; setTimeout(f, 1000*prompt('当前标签关闭时间(s)'));
">定时关闭</a>

###GetFlv
支持y2b和优酷等，比较少用。
<a href='
javascript:window.location.href='http://flvgo.com/download?url='+encodeURIComponent(location.href);
'>GetFlv</a>

###WpFill
自动填充wordpress的回复表单，以后就不用填用户名、邮箱和网址了。
<a href='
javascript:(function(){document.getElementById('author').value='yantze';document.getElementById('email').value='yantze@126.com';document.getElementById('url').value='http://vastiny.com';document.getElementById("comment").focus();})()
'>wpFill</a>

###Send to Kindle
可以直接去klip.me里面添加你自己的链接，自动发送到kindle
[klip.me](http://www.klip.me/sendtokindle/)

###Gitignore.io
gernerate the gitignore file for special soft/language.
生成gitignore文件，比如输入xcode，自动添加各种build等要忽略的gitignore文件
[gitignore.io](https://www.gitignore.io)

###WebProxy
tips:不要在里面去输入要帐号密码的网页
http://dangdangmao.cc
