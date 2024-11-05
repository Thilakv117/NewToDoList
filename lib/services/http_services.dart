import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http_interceptor/http/intercepted_http.dart';

import 'interceptors.dart';

class HttpService {
  static var http = InterceptedHttp.build(interceptors: [
    HttpInterceptor(),
  ]);

  static const String domainName ="https://thejustinandrew.pythonanywhere.com/";

  static Future httpGet(var status,String url) async {
    var uri = Uri.encodeFull(domainName + url);
    return await http
        .get(Uri.parse(uri), headers: {"Access-Control-Allow-Origin": "*"});
  }

  static Future httpPost({required String url, var params}) async {
    var uri = Uri.encodeFull(domainName + url);
    return http.post(Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json',
        },
        body: params,
        encoding: Encoding.getByName("utf-8"));
  }

  static Future httpUpdate({required String url, required String title}) async {
    var uri = Uri.encodeFull(domainName +url);
    return http.post(Uri.parse(url),body: title,headers: {"Content-Type": "application/json"});
  }
}
