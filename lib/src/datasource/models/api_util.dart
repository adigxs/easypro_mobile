import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';

ApiError createApiErrorFromDioError(DioError error) {
  return ApiError(
    type: _getTypeFromDioError(error),
    message: _extractMessageForDioError(error),
    error: error,
  );
}

ApiError unknownError(Object? e) {
  return ApiError(
    message: "An unknown error has occurred. Our teams are on the case.",
    error: e,
    type: ApiErrorType.unknown,
  );
}

ApiErrorType _getTypeFromDioError(DioError error) {
  if (error.response?.statusCode.toString().startsWith('5') ?? false) {
    return ApiErrorType.server;
  } else if (error.response == null) {
    return ApiErrorType.network;
  }
  return ApiErrorType.unknown;
}

String _extractMessageForDioError(DioError error) {
  // print(error.response!.data['messages']["username"]);
  if (error.response?.data != null) {
    if (error.response!.statusCode == HttpStatus.serviceUnavailable ||
        error.response!.statusCode == HttpStatus.badGateway) {
      return "Server temporarily unavailable, please try again later.";
    } else if (error.response!.statusCode == HttpStatus.notFound) {
      return error.response?.data?['message'].toString() ??
          "We are not able to process your request at this time. Please try again later.";
    } else if (error.response?.statusCode == HttpStatus.unauthorized) {
      return "You are not authorized to access this resource. or the credentials are incorrect, please try again";
    } else if (error.response?.statusCode == HttpStatus.badRequest) {
      return error.response?.data?['message']?.toString() ??
          "Something went wrong, please try again later.";
    } else if (error.response!.data is String) {
      return error.response!.data;
    } else if (error.response?.statusCode == HttpStatus.internalServerError) {
      return "We are experiencing a problem with the processing of your request. Our teams are on the case.";
    } else if (error.response?.data['message'] != null) {
      final Object? message = error.response!.data!['messages']!;
      if (message is String) {
        return message;
      } else if (message is List) {
        return message.map((e) => e['message']).join('\n');
      }
    }
  } else if (error.type == DioErrorType.other &&
      error.error is SocketException) {
    return "Cannot connect to the server. Please check that you have internet access.";
  }

  return "An unknown error has occurred. Our teams are on the case.";
}
