import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/io_client.dart';


const String _ipaddress = "https://dog.ceo/";
const String _contextPath = 'api/';
const String _url = _ipaddress + _contextPath;

solveCertError() {
  final ioc = HttpClient();
  ioc.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  final http = IOClient(ioc);

  return http;
}

var http = solveCertError();

Future<dynamic> postAnonymousData({data, apiUrl}) async {
  var fullUrl = Uri.parse(_url + apiUrl);
  return await http.post(fullUrl,
      body: jsonEncode(data), headers: _getHeaders());
}

Future<dynamic> getAnonymousData({apiUrl}) async {
  var endpoint = _contextPath + apiUrl;
  final uri = Uri.http(_ipaddress, endpoint);
  return await http.get(uri, headers: _getHeaders());
}

_getHeaders() => {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
