###Blog
[![Build Status](https://travis-ci.org/yantze/yantze.github.com.svg?branch=source)](https://travis-ci.org/yantze/yantze.github.com)

power by hexo

底部添加了删除广告的代码:
```javascript
document.getElementsByClassName("incap_page-tooltip")[0].innerHTML=''
```

###安装
添加下面的内容到_config.yml
```
plugins:
- hexo-generator-api
# Posts displayed per page in list
api_posts_per_page: 5
```
执行
```
npm install hexo-generator-api --save
hexo g
```
即可

####注意
在切换不同的repo时，要删除网站源目录的.deploy文件夹，否则会出错

####一些参考：
https://github.com/chenall/hexo-theme-chenall

http://howiefh.github.io/2014/04/20/hexo-optimize-and-my-theme-landscape-f/
