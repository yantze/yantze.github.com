title: Yaf和Requirejs
date: 2014-06-25 21:24:46
tags:
categories: tools
---


yaf简介
Yaf有着和Zend Framework相似的API, 相似的理念, 而同时又保持着对Bingo的兼容, 以此来提高开发效率, 规范开发习惯. 本着对性能的追求, Yaf把框架中不易变的部分抽象出来,采用PHP扩展实现(c语言),以此来保证性能.在作者自己做的简单测试中, Yaf和原生的PHP在同样功能下, 性能损失小于10%, 而和Zend Framework的对比中, Yaf的性能是Zend Framework的50-60倍.它提供了Bootstrap, 路由, 分发, 视图, 插件, 是一个全功能的PHP框架。

requirejs简介
RequireJS是一个Javascript 文件和模块框架，不仅仅用于加载模块依赖和相关的命令，RequireJS帮助我们写出模块化的JavaScript代码，这非常有利于代码的可扩展性和重用性。 并且在一般的webapp很多人都在使用这种模块化的开发方式，国内有一个很好的模块化框架是sea.js，很受好评。

项目简介：
放在了github上，https://github.com/yantze/yaf
项目demo在 http://cartbyyaf.sinaapp.com

架构图
编写举例
性能评测


