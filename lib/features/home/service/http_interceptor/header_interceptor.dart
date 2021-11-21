import 'dart:async';
import 'dart:developer';
import 'package:chopper/chopper.dart';

class HeaderInterceptor implements RequestInterceptor {
  static const String appID = "eea6983fdd8aa9a36cedb975d6e65abf";

  @override
  FutureOr<Request> onRequest(Request request) async {
    Request newRequest = request.copyWith(parameters: {
      'appid': appID,
      'units': 'metric',
      ...request.parameters,
    });

    log(newRequest.url);
    log(newRequest.parameters.toString());

    return newRequest;
  }
}
