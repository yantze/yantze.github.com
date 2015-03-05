title: WorkFlow
date: 2014-08-26 11:24
tags:
categories: tools
---

##Windows: Hyper-V + CentOS
这篇文章虽然是讲Hyper-V虚拟机的灵活运用，但是里面提到的tmux,samba和一些其它的linux命令很可能会提升你的幸福感.


##应用场景
**可以做什么**
- linux:运维，开发所有linux应用，快速搭建LNMP/LAMP，docker等一系列工程，并且可以当作一个工作站，linux的界面都不用开启
- 集群:前段时间，就是用Hyper-V开了三台CentOS做一个solr+nutch+hadoop集群，效果很不错

**不可以**
- 图形处理，涉及到图形的内容都不擅长，当然也可以做，但是没有其它虚拟机做得好
- linux图形界面不够流畅，图形延时很大(windows图形界面就很流畅)
- 没有usb和声卡功能！

##架构
**Hyper-V**
配置虚拟交换机三个，wlan(外网)、vlan(内部网)、wifi(无线网)
我把这三个网卡都加载到了centos，网段为(都是系统自动配置)
```
wlan:192.168.100.0/24 或者 HDCP
vlan:192.168.137.0/24
wifi:DHCP
```
网卡的完美搭配
vlan的ip地址是微软默认的，如果我需要wifi的网络进入到vlan中，我可以直接在网络管理的属性里面设置共享给vlan，就可以应对很多场景
注意：如果vlan出现异常，即出现连不上192.168.137.1或者连上之后，不能上外网，在cmd中检查`net start sharedaccess`是否开启。

**Windows Mmaster的配置**
hosts:
因为常常ip会变，所以就直接在hosts文件里面配置一下，以后直接用域名就可以访问
192.168.137.131 wess
putty:
通过快捷方式 ` E:\program\shortcut\putty.exe -i d:\Work\ssh\wess.ppk -P 22333 yantze@wess ` 实现无密码自动登录centos

**CentOS**
zsh:
提供了很多实用的技巧

tmux:
实现一个putty可以开多个窗口，关闭putty，继续后台执行等强大的功能

vim:
如果你喜欢，就是一个强大的编辑器

samba:
windows和centos通过smb协议共享文档，可以通过这个实现IDE编程
samba在linux下配置容易出错，可以参考我的这个配置,[链接](https://github.com/yantze/dotfiles/blob/master/misc/samba.smb.conf#L300)
配置好后，执行testparm，测试smb是否正确配置
在Windows资源管理器里面登录的时候，用户名一定要在前面加'\'反斜杠

brew:
centOS居然也可以用brew安装最新的软件

windows与linux互连:
putty、tmux、vim与xserver通信，使得[linux与windows共享剪贴板(clipboard)](http://www.cnblogs.com/vastiny/tag/route/)

##应用案例
**路由**
多网卡环境不得不说路由的问题！
可以通过route / ip route 操作，我自己之前写过一些关于route的例子,[链接](http://www.cnblogs.com/vastiny/tag/route/)

**docker**
docker的操作官网都有，操作起来很简洁。
docker本来有一个观念，与vagrant不同就是，docker打算一个程序用一个container！这才能体现出它的简洁之美

**LNMP/LAMP**
这个就不用多说了，配置好就行了

mac下的vagrant
mac下的vagrant类似windows下linux上的docker，效果还不错


##windows
**命令行**
autojump+cmd,正在使用,简单就好
babun，很多的特性，接近linux console风格，软件构成：cmd+cygwin
cmder+autojump，很多的特性，没有babun方便,软件构成：cmd+conmou+cmder+clink+msysgit+mingw

##注
- Windows8集成Hyper-V，不可以和vitrulBox, VMware等其它虚拟机一起使用
- 启用hyper-V组件就可以使用，因为是系统本来就支持的，性能方面做得很不错
- 通过hyper-V安装CentOS6或者7，试过很多linux发行版，我推荐使用CentOS
- Hyper-V原生支持PowerShell批量部署


##屏幕截图
![](/image/putty_desktop.png)
![](/image/putty_html.png)
