/*
进行认证请求
为了从更多的Web服务获取数据，有些时候您需要提供授权。有很多方法可以做到这一点，但最常见的可能是使用HTTP header中的Authorization。

添加 Authorization Headers
http package提供了一种方便的方法来为请求添加headers。您也可以使用dart:iopackage来添加。
 */
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';
import 'package:flutter/material.dart';

Future<http.Response> _fetchPost() {
  return http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    // 发送授权headers信息给后台
    headers: {HttpHeaders.authorizationHeader: 'Basic your_your_api_token_here'},
  );
}


class _Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  _Post({this.userId, this.id, this.title, this.body});

  factory _Post.fromJson(Map<String, dynamic> json) {
    return _Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}

Future<_Post> fetchAuthorizationPost() async {
  final response =await http.get(
    'https://jsonplaceholder.typicode.com/posts/1',
    // 发送授权headers信息给后台
    headers: {HttpHeaders.authorizationHeader: 'Basic your_your_api_token_here'},
  );

  final jsonModel = json.decode(response.body);
  return _Post.fromJson(jsonModel);
}