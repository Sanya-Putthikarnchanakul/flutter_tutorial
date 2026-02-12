import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_tutorial/app_config.dart';

class DummyJsonApi {
  Dio? _dio;

  DummyJsonApi() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        contentType: Headers.jsonContentType,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        sendTimeout: Duration(seconds: 30),
      ),
    );

    if (AppConfig.useMitmProxy) {
      _dio?.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          // HttpClient client;
          // _setupContext().then((context) {
          //   client = HttpClient(context: context);
          //   client.findProxy = (uri) => 'PROXY ${AppConfig.proxyUrl}:${AppConfig.proxyPort}';
          //   return client;
          // });

          //return client;

          HttpClient client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true;
          client.findProxy = (uri) => 'PROXY ${AppConfig.proxyUrl}:${AppConfig.proxyPort}';
          return client;
        },
      );
    }

    _dio?.interceptors.add(LogInterceptor());
  }

  // Future<SecurityContext> _setupContext() {
  //   final completer = Completer<SecurityContext>();

  //   final context = SecurityContext.defaultContext;

  //   rootBundle.load('assets/mitmproxy-ca.pem').then((certBytes) {
  //     context.setTrustedCertificatesBytes(certBytes.buffer.asUint8List());
  //     completer.complete(context);
  //   });

  //   return completer.future;
  // }

  Future<void> login() async {
    try {
      await _dio?.post(
        '/user/login',
        data: {
          'username': 'emilys',
          'password': 'emilyspass',
          'expiresInMins': 10,
        },
      );
    } on DioException catch (ex) {
      print(ex);
    }
  }

  Future<void> products() async {
    try {
      await _dio?.get('/products');
    } on DioException catch (ex) {
      print(ex);
    }
  }

  Future<void> todos() async {
    try {
      await _dio?.get('/todos');
    } on DioException catch (ex) {
      print(ex);
    }
  }
}
