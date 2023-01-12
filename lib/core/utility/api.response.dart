// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import '../base/error/error_response.dart';
import '../base/model/base_model.dart';

class ResponseParser<T extends BaseModel> {
  dynamic response;
  ResponseParser({
    this.response,
  });
  bool get isList => response is List ? true : false;
  bool get isMap => response is Map ? true : false;
  bool get isString => response is String ? true : false;
  // R is the response type
  // T is the model type
  // model is the parse model
  R? fromList<R>({T? model}) {
    if (isList) {
      return response!.map((item) => model!.fromJson(item)).cast<T>().toList() as R;
    } else {
      try {

        return ErrorResponse(message: response) as R;
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  T? fromMap({T? model}) {
    if (isMap) {
      return model!.fromJson(response);
    } else {
      try {
        return ErrorResponse(message: response) as T;
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  T? fromRawValue({T? model}) {
    if (isString) {
      return model!.fromJson(json.decode(response));
    } else {
      try {
        return ErrorResponse(message: response) as T;
      } catch (e) {
        throw Exception(e);
      }
    }
  }
  List<T>? fromStringList({T? model}) {
    if (isString) {
       final List<dynamic> result = jsonDecode(response);
        final List<T> resultList = [];
        for (var e in result) {
          resultList.add(model!.fromJson(e));
        }
      return resultList;
    } else {
      try {
        return ErrorResponse(message: response) as List<T>;
      } catch (e) {
        throw Exception(e);
      }
    }
  }
}
