import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';


const log = Logger("");

class DioHelper {
  final dio = Dio(
    BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        receiveDataWhenStatusError: true,
        contentType: "multipart/form-data; boundary=<calculated when request is sent>",
    ),
  );

  Future<CustomResponse> getData({required String url, Map<String, dynamic>? params,}) async {
    if (params != null) {
      params.removeWhere((key, value) => params[key] == null || params[key] == "");
    }
    try {
      if (url.isNotEmpty) {
        Response response = await dio.get(
          url.startsWith("http") ? url : url,
          options: Options(headers: {
            "Accept": "application/json",
            "Accept-Language": "ar",
            "lang": "ar",
          }),
          queryParameters: params,
        );
        return CustomResponse(
          success: true,
          statusCode: 200,
          msg: (response.data["message"] ?? "Your request completed successfully").toString(),
          response: response,
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        return CustomResponse(
          success: true,
          statusCode: 200,
        );
      }
    } on DioException catch (err) {
      return handleServerError(err);
    }
  }

  CustomResponse handleServerError(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response!.data.toString().contains("DOCTYPE") || err.response!.data.toString().contains("<script>") || err.response!.data["exception"] != null) {
        return CustomResponse(
          errType: 2,
          statusCode: err.response!.statusCode ?? 500,
          msg: "Server Error",
        );
      }
      if (err.response!.statusCode == 401) {
        // showToast(err.response!.data["message"], duration: 3);
        // navigateTo(page: const SplashView(), leaveHistory: false);
      }
      try {
        return CustomResponse(
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: (err.response!.data["errors"] as Map).values.first.first,
          response: err.response,
        );
      } catch (e) {
        return CustomResponse(
          statusCode: err.response?.statusCode ?? 500,
          errType: 1,
          msg: err.response?.data["message"],
          response: err.response,
        );
      }
    } else if (err.type == DioExceptionType.receiveTimeout || err.type == DioExceptionType.sendTimeout) {
      log.error(err.response!.data);
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 0,
        msg: "Time out error",
      );
    } else {
      if (err.response == null) {
        // print(err.stackTrace);
        // print(err.response);
        log.error(err.type, includeStackTrace: false);
        log.error(err.error, includeStackTrace: false);
        log.error(err.message, includeStackTrace: false);
        log.error(err.message, includeStackTrace: false);
        log.error(err.requestOptions.toString(), includeStackTrace: false);
        return CustomResponse(
          statusCode: 402,
          errType: 0,
          msg: "No Connection",
        );
      }

      return CustomResponse(
        statusCode: 402,
        errType: 2,
        success: false,
        msg: "Server Error",
      );
    }
  }
}

class CustomResponse {
  bool success;
  int? errType;
  String msg;
  int statusCode;
  Response? response;
  dynamic error;

  CustomResponse({
    this.success = false,
    this.errType = 0,
    this.msg = "",
    this.statusCode = 0,
    this.response,
    this.error,
  });
}

void printResponse(Response response) {
  log.warning("---------------------Start Of Request Details ---------------------------");
  log.warning("\x1B[31m(${response.requestOptions.method}) ( ${response.requestOptions.baseUrl + response.requestOptions.path} )");
  log.info("\x1B[50m( Headers )\x1B[0m");
  if (response.requestOptions.headers.isNotEmpty) {
    response.requestOptions.headers.forEach((key, value) {
      log.info("\x1B[15m$key : $value\x1B[0m");
    });
  } else {
    log.info("\x1B[15mNo Headers\x1B[0m");
  }
  if (response.requestOptions.method == "GET") {
    log.fine("\x1B[15m( Query Parameters )\x1B");
    if (response.requestOptions.queryParameters.isNotEmpty) {
      response.requestOptions.queryParameters.forEach((key, value) {
        log.fine("\x1B[15m$key : $value\x1B[0m");
      });
    } else {
      log.fine("\x1B[15mNo Parameters\x1B[0m");
    }
  } else {
    log.fine("\x1B[15m( Data )\x1B");
    FormData data = response.requestOptions.data;
    if (data.fields.isNotEmpty) {
      for (var element in data.fields) {
        log.fine("\x1B[15m${element.key} : ${element.value}\x1B[0m");
      }
    } else {
      log.fine("\x1B[15mNo Data\x1B[0m");
    }
  }

  log.fine("\x1B[15m--------------------- Response ---------------------------\x1B[0m");
  var resp = jsonEncode(response.data);
  log.fine(resp);

  log.debug("---------------------End Of Request Details ---------------------------");
}

class Failure {
  String msg;

  Failure({required this.msg});
}

class APIFailure extends Failure {
  int statusCode;

  APIFailure({required this.statusCode, required super.msg});
}
