title: WorkFlow
date: 2014-08-26 11:24
tags:
categories: tools
---

#windows工作环境
这篇文章虽然是讲hyper-v的，但是里面很多其它想法或许对你有用

##Hyper-v + CentOS
windows8集成Hyper-v，不可以和vitrulBox, VMware等其它虚拟机一起使用
启用hyper-v组件就可以使用，因为是系统本来就支持的，性能方面做得很不错
通过hyper-v安装CentOS6或者7，我试过很多linux发行版，我推荐使用centos
hyper-v原生支持powershell批量部署

##应用场景
**可以做什么**
windows:原生支持，高性能，有很好的兼容性
linux:运维，开发所有linux应用，快速搭建lnmp，docker等一系列工程，并且可以当作一个工作站，linux的界面都不用开启
集群:前段时间，就是用hyper-v开了三台centos做一个solr+nutch+hadoop集群，效果很不错

**不可以**
图形处理，涉及到图形的内容都不擅长，当然也可以做，但是没有其它虚拟机做得好
linux图形界面不够流畅，图形延时很大
windows图形界面就很流畅
没有usb驱动和声卡驱动！

##架构
**hyper-v**
配置虚拟交换机三个，wlan(外网)、vlan(内部网)、wifi(无线网)
我把这三个网卡都加载到了centos，网段为 wlan:192.168.100.0/24 OR HDCP, vlan:192.168.137.0/24, wifi:DHCP
网卡的完美搭配
vlan的ip地址是微软默认的，如果我需要wifi的网络进入到vlan中，我可以直接在网络管理的属性里面设置共享给vlan，就可以应对很多场景
注意：如果vlan出现异常，即出现连不上192.168.137.1或者连上之后，不能上外网，检查net start sharedaccess是否开启。

**windows MASTER的配置**
hosts:
因为常常ip会变，所以就直接在hosts文件里面配置一下，以后直接用域名就可以访问
192.168.137.131 wess
putty:
通过快捷方式E:\program\shortcut\putty.exe -i d:\Work\ssh\wess.ppk -P 22333 yantze@wess
实现无密码自动登录centos

**centos**
zsh:
提供了很多实用的技巧
tmux:
实现一个putty可以开多个窗口，关闭putty，继续后台执行等强大的功能
vim:
如果你喜欢，就是一个强大的编辑器
samba:
windows和centos通过smb协议共享文档，可以通过这个实现IDE编程
samba在linux下面还是不容易配置的，可以参考我的这个配置,[链接](https://github.com/yantze/dotfiles/blob/master/misc/samba.smb.conf#L300)
配置好后，执行testparm，测试smb是否正确配置
在登录的时候，用户名一定要在前面加'\'反斜杠
brew:
这里面居然也可以用brew安装最新的软件

zsh，tmux，vim，samba是我在windows下的四剑客，运用得当，就可以说，windows是个好系统。
可以通过putty、tmux、vim与xserver通信，使得能[linux与windows共享剪贴板(clipboard)](http://www.cnblogs.com/vastiny/tag/route/)

##应用案例
**路由**
多网卡环境不得不说路由的问题！
可以通过route / ip route 操作，我自己之前写过一些关于route的例子,[链接](http://www.cnblogs.com/vastiny/tag/route/)

**docker**
docker的操作官网都有，操作起来很简洁。
docker本来有一个观念，与vagrant不同就是，docker打算一个程序用一个container！这才能体现出它的简洁之美

**lnmp**
这个就不用多说了，配置好就行了

mac下的vagrant
mac下的vagrant类似windows下linux上的docker，效果还不错


##windows
**命令行**
现在使用autojump+cmd,简单就好
babun，也有很多的特性，接近linux console风格，软件构成：cmd+cygwin
cmder+autojump，有很多的特性，可能没有babun方便,结构：cmd+conmou+cmder+clink+msysgit+mingw

##注
无论如何都凑不到两千字~
我现在开始想向mac转移，因为我的这种配置结构，在mac下面就是帮我搭配好了的，但是mac下面的浏览器都很差，界面也不美观
各用所长吧


##屏幕截图
![](/image/putty_desktop.png)
![](/image/putty_html.png)
![](/image/babun.png)
