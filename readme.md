# Blog

## There have many themes

https://github.com/poole

https://github.com/jasonlong/cayman-theme

[kramdown syntax](http://kramdown.gettalong.org/syntax.html)

## 使用七牛做图片缓存
### 用「七牛云插件」
配置好相关的密钥和参数
拖放本地 _image 的图片到七牛里面生成链接。
### 用vim 替换 MarkEditor 所有的相对路径
```
# 替换
# `./_image/2016-02-06 14-22-14.jpg`
# 为
# `http://7xppiy.com1.z0.glb.clouddn.com/vastiny_image/2016-02-06 14-22-14.jpg`

:%s/\.\/_image/http:\/\/7xppiy.com1.z0.glb.clouddn.com\/vastiny_image/i
```

## 常见输入Helper
### 个别输入法难打的字符
「 」
『 』

## 同步的 fileshook
```
git add . -A && git commit -a && git push
```