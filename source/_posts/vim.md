title: Vim
date: 2014-06-17 21:24
tags: vim
categories: tools
---

Vim 是个神奇的编辑器，不论编辑哪种语言的代码，总能找到一些插件来提升编码体验。就算是用了挺久的 Vim，也时不时地会听到别人说起一些自己从没用过但是很实用的技巧。会怀念 Sublime Text  功能强大却又容易上手的设计理念。但是从没有一种理由让我换用其它编辑器，因为总会有一个 Vim 插件能够填补你内心深处的不满足。
我的使用原则就是，能用就用，如果有更好的IDE就使用IDE，不要走火入魔就行。
something else;


最开始接触VIM的时候，听人说VIM很好，就用了一下VIM，看VIM简陋不堪，所以就搁置了几个月，后来看到了[Ruchee](https://github.com/ruchee/vimrc)的vim配置文档，他的配置简单容易部署，所以后来在几分钟就建好了一个漂亮的vim编辑器的时候，高效编辑，高度灵活，我就喜欢上了这款编辑器。
下面是我github上[vim项目](https://github.com/yantze/vimrc)的一部分说明

###一些常用快捷键说明
```
/xxx                    查找xxx字符串
,ci                     注释选定行(自动识别文件类型后添加注释)
,n/,p                   切换buffer的标签(因为vim的一个窗口里面有多个buffer)
10G                     数字10和大写的G，跳到第十行

:s/x/b                  用"#"注释当前行
:2,50s/x/b              在2~50行替换x为b
:.,+3s/x/b              在前行和当前行后面的三行，替换x为b
:%s/x/b                 在所有行替换x为b
:set notextmode         这个可以去掉^M这个符号
:set pastetoggle        可以解决在linux命令行复制内容的时候，内容被识别为vim操作和乱序缩进

f                       查找当前行的字符
gb                      go browser插件，光标下是url链接，用默认浏览器打开链接，如果是选中的字符串，浏览器搜索
gf                      如果光标下是一个文件链接，则可以用vim自动打开这个文件
gd                      找到光标下的标签定义
[{                      跳回当前代码块起始的"{"
Ctrl+Tab/Ctrl+Shift+Tab 切换vim标签
Ctrl+w,v/h              在gvim下创建多窗口
Ctrl+h/j/k/l            在gvim下切换多窗口
```


当你了解到了基本的使用方法后，你可以读看看我在.vimrc中的文档，里面有很多详细的技巧，熟悉后能和sublime和notepad++匹敌
当然_vimrc.bundles这个文件里面是需要加载的插件，里面有介绍每个插件是拿来干嘛的，也可以了解一下
我之前学习vim的时候，收集到的一些资料，这次重新复习了里面的内容，整理了一下发布了出来，就把它当成中级vim的入门手册吧，[下载地址](https://github.com/yantze/vimrc/blob/master/VIMdoc.md)。



###Thanks

这份vim配置的所以完成，会如此热爱vim，是看到了ruchee的vimrc的配置
其完善的配置让我感觉vim是如此的简单
[ruchee](https://github.com/ruchee/vimrc)


我也参考了很多的vim配置:
[vimfiles](https://github.com/coderhwz/vimfiles)
[dotfiles](https://github.com/luin/dotfiles)
[vimrc](https://github.com/rhyzx/vimrc)

前段时间找到了vim的集成配置，功很强大
[The Ultimate Vim Distribution](http://vim.spf13.com/)
初学教程
[Learn Vimscript the Hard Way](http://learnvimscriptthehardway.stevelosh.com/)
[为什么Vim使用HJKL键作为方向键](http://www.cnbeta.com/articles/185694.htm)
