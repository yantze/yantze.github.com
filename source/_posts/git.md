title: Git
date: 2014-06-08 09:24
tags: [git, lts]
categories: tools
---

##目录

* 简化工作流程
    * [常用提交流程](#normal_commit)

* 初始化
    * [初始化一个空库](#init)
    * [在本地新建了一个库，同步已经存在的库](#pull_exist)

* 分支
    * [创建新的分支](#branch)
    * [常用分支管理](#branch_manage)
    * [合并分支](#merge)
    * [从远程拿下一个新的分支](#branch_newpull)

* 标签
    * [使用tag上线发布](#tag)
    * [带tag的版本提交](#tag_submit)

* 回滚
    * [常用后悔管理](#regret)
    * [操作记录高级命令](#log)


* Misc
    * [把当前仓库生成压缩文档 - zip](#archive)
    * [bug修复，而当前的工作未完成 - stash](#stash)
    * [git添加ssh key实现无密码提交](#ssl_nopwd)
    * [git实现https方式无密码提交](#https_nopwd)
    * [使用git的代理](#proxy)
    * [优化git结构 - gc](#gc)
    * [忽略指定文件](#ignore)
    * [创建命令别名 - alias](#alias)
    * [查找一个文件中一行的作者](#blame)

* 团队协作——标准工作流程
    * 基本流程
    * 常驻分支：master和develop
    * 临时分支： [feature](#feature),release,hotfix







---
##正文

###基本常识
当对代码的修改完成并存盘后，你可以通过git status 命令查看当前工作目录下文件的状态。
工作目录中的文件状态共有四种：
1. untracked 未纳入git版本管理的文件，git不会对他们进行版本控制。
2. unmodified 上次已提交且未修改的文件，使用git status命令却没有在命令下方列出的文件，均处于这个状态。
3. modifid 正在修改的文件，使用git commit命令不会提交。
4. staged 准备提交的文件，使用git commit命令则会提交。

<a name='normal_commit'></a>
###常用提交流程
add -> commit -> pull / push
```
git add filename #提交所有 git add .
git diff -cached #查看要提交的文件
git commit -m "the file description"  #这行只有在git add之后才效，因为是创建记录
#git commit 有一个简便的参数 -a,可以直接将处于modifid和staged两种状态的文件一次提交
#git commit -a -m "content description"
git log #查看之前提交的记录
git status #查看当前项目下是否有未添加的文件
```


<a name='branch'></a>
###创建branch分支
```
git branch detail:Git鼓励大量使用分支
查看分支：git branch
创建分支：git branch name
切换分支：git checkout name
创建+切换分支：git checkout -b name
合并某分支到当前分支：git merge name
删除分支：git branch -d name
```

<a name='branch_manage'></a>
###常用分支管理
```
git branch project_branch_version [master]
git tag 1.0 project_branch_version  # git tag 列表
git checkout projectname #切换project
git rebase project_branch_version # 把maste上的提交放到branch上，生成新的branch
git merge project_branch_version #同上
git branch -d project_branch_version
```
至于merge和rebase的区别。假设这是目前的状态：
```
      C---D---E local
     /
A---B---F---G remote
```
merge之后是这样：
```
      C---D---E local
     /         \
A---B---F---G---H remote
```
而rebase之后是这样：
```
              C'--D'--E' local
             /
A---B---F---G remote
```
当然，他们的效果自然是一样的。



<a name='regret'></a>
###常用后悔管理
```
git checkout -- db.txt #把下面的文件撤出缓冲，还原文件到最后一次提交
git reset HEAD db.txt #如果执行了git add .要先执行这条的语句，再执行上面的语句

git reset --hard HEAD #还原到指定的提交，文件也会变，如果之后忘了HEAD可以用下面命令
git reflog #查看所有分支 

git branch newbranch v1.0  #tag v1.0 是之前建好了的

如果找不到修改之前的分支可以用
git reflog #查看所有提交，包括删除的
git branch -a #查看所有分支，包括删除的
```


<a name='log'></a>
###操作记录
```
git log file
git log directory/
git log -S'str'
通过文件，目录，字符串来查找一次提交
git log -p 可以显示改了什么具体内容
git log --stat 可以显示哪个文件改了
git log --pretty=oneline 可以显示每次提交的注释，并且缩为一行
git log --pretty=format:'%h was %an, %ar, message: %s' 自定义的日志输出
git log --pretty=format:'%h : %s' --graph 图形日志输出
git log --graph --pretty=oneline --abbrev-commit 同上，不过有颜色好看一些
```


<a name='archive'></a>
###归档
```
git log --pretty=oneline #把所有的历史记录整合成achieve
git archive --format=zip --prefix=directory/ tagname > archivefile.zip # 生成压缩文档
```



<a name='merge'></a>
###合并
下面master是当前分支，dev是要被合并的分支
```
合并分支并提交不使用fast-forward：noff有合并记录，否则合并后完全没有merge迹象
git merge --no-ff -m "merge with no-ff" dev

git rebase #这个合并是重建另外一个分支所有提交并且每次提交都用merge合并
```

<a name='branch_newpull'></a>
###从远程拿下一个新的分支
现在在线仓库里面有new_feature这个分支
我同步到本地的仓库
git pull origin new_feature:new_feature
一定不要用git pull origin new_feature
这样是把远程new_feature分支合并到本地仓库的当前分支


<a name='tag'></a>
###使用tag上线发布系统
```
git tag v3  #创建标签
git push origin v3 #推送标签
git checkout –b v3 v3 #从标签里面创建分支并转向到分支
git checkout v2 #回滚直接到前一个tag
```


<a name='tag_submit'></a>
###带tag的版本提交
```
git log –oneline #首先查看以前的commit

#假如有这样一个commit：8a5cbc2 updated readme
#这样为他添加tag
git tag -a v1.1 8a5cbc2

git tag -d v1.0 #删除tag
git push origin –tags #同时推送tags
git push origin --tags #可以推送全部未推送过的本地标签
git push origin tagname #可以推送一个本地标签
git push origin :refs/tags/tagname #可以删除一个远程标签
```

<a name='stash'></a>
###bug修复，而当前的工作未完成
修复bug时，我们会通过创建新的bug分支进行修复，然后合并，最后删除；
当手头工作没有完成时，先把工作现场git stash一下，这样可以保存当前的状态，并且滚回到最后一次提交
然后去修复bug，修复后，再git stash pop，回到工作现场。

<a name='feature'></a>
###开发新的feature
开发一个新feature，最好新建一个分支；
如果要丢弃一个没有被合并过的分支，可以通过git branch -D name强行删除。


<a name='init'></a>
###初始化一个空库
```
git init
git commit -a -m "explain the the commit content" #这里包含了git add . 和git commit
git remote add origin master "ssh/https" #add origin改成remove origin可以删除远程库链接
git push -u origin master #推送master到远程，并且建立连接，下次只要git push即可，origin是远程库的名字，master是分支
```


<a name='submodule'></a>
###Submodule
Git Submodule可以把别人的git repo放到你目前git repo的任意位置。
然后可以更新repo然后还可以再pull
```
git submodule add https://github.com/yantze/yaf.git yafdir
```
在clone一个项目的时候包含这个git submodule需要使用下面的命令才能下载
```
git submodule init
git submodule update
```
注意，如果之前有自己克隆相同的库，先删除之前的同名库，然后提交后再添加submodule



<a name='gc'></a>
git gc 优化git
git每次add都是添加变化，查找的时候是在package的基础之上，用gc优化后，就可以加快查找速度


<a name='pull_exist'></a>
如果远程已经有了内容，先pull
git pull #如果本地库是新创建的，会自动生成branch master
提示说git pull 要放到那个branch
git pull origin master

<a name='ignore'></a>
git忽略特定文件
http://blog.csdn.net/benkaoya/article/details/7932370

<a name='alias'></a>
git 创建别名
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

可以参考我的别名配置文档
[gitconfig](https://github.com/yantze/dotfiles/blob/master/git/_gitconfig#L5)

<a name='blame'></a>
查看checkfilename文件中每一行的代码是谁写的
git blame checkfilename


<a name='ssl_nopwd'></a>
###git添加ssh key实现无密码提交
puttygen.exe
ssh-keygen
教程：https://help.github.com/articles/generating-ssh-keys
error1:
[root@testcentos01 ~]# ssh-add
Could not open a connection to your authentication agent
在shell下执行
ssh-agent bash --login -i
然后再执行ssh-add就ok了


<a name='https_nopwd'></a>
###git实现https方式无密码提交
```
设置记住密码（默认15分钟）：
git config --global credential.helper cache

如果想自己设置时间，可以这样做：
git config credential.helper 'cache --timeout=3600'
这样就设置一个小时之后失效

长期存储密码：
git config --global credential.helper store

增加远程地址的时候带上密码也是可以的(推荐)
https://yourname:password@git.oschina.net/name/project.git

同时如果只是想某个项目可以自动提交，也可以在.git文件夹下config中设置

如果你正在使用ssh而且想体验https带来的高速，那么你可以这样做： 切换到项目目录下 ：
cd projectfile/
移除远程ssh方式的仓库地址
git remote remove origin

增加https远程仓库地址
git remote add origin https://yourname:password@git.oschina.net/name/project.git

注意：https存储密码的方法不是很安全
因为用store方式存储，明文密码将存在与.gitconfig同目录下的.git-credentials文件中
```

<a name='proxy'></a>
###使用git的代理
由于在一些局域网的情况下，需要时用代理才能访问外网需要设置才能访问
下面的是http的代理，如果是ssl的代理由于比较复杂，可以去搜索引擎查找。
```
git config --global http.proxy http://172.31.195.32:8081
git config --global https.proxy http://172.31.195.32:8081
git config --global http.sslverify false
git config --global https.sslverify false
git config --global http.postBuffer 24288000
```

你所有关于git的配置文件都在~/.gitconfig这个文件下。
可以参考我完整的配置[gitconfig](https://github.com/yantze/dotfiles/blob/master/git/_gitconfig)


###参考
推荐一篇易懂的英文文章
A successful Git branching model
http://nvie.com/posts/a-successful-git-branching-model/

git流程参考自:
http://www.ruanyifeng.com/blog/2012/07/git.html
https://ruby-china.org/topics/15737

git用https存储密码参考自:
http://my.oschina.net/silentboy/blog/217766

团队协作参考自:
http://my.oschina.net/silentboy/blog/210094

git代理参考自:
http://ricksu.blog.163.com/blog/static/18906433820125294929508/
http://blog.csdn.net/ijibu/article/details/10830853

git merge/rebase 字符图来自：
http://blog.segmentfault.com/codecabin/1190000000593914


git很多高级命令来自下面两本书:
[gitbook](http://lvwzhen.gitbooks.io/git-tutorial/)
[git pro](http://git.oschina.net/progit/)





