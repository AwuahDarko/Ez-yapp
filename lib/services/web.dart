import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class Web {
  static String url = 'http://10.0.2.2:5000'; // 10.0.2.2   192.168.49.124
  static String imageUrl = url + "/uploads/";

  static bool debugMode = true;

  static void makeGET(String route,
      {required Function(http.Response) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';
      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      http.Response res = await http.get(str, headers: headers);
      onResponse(res);
    } catch (e) {
      print('make get error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<http.Response?> makeGETF(String route, [String baseUrl = ""]) async {
    http.Response? res;

    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw 'Please check your internet connection';
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';
      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      res = await http.get(str, headers: headers);
    } catch (e) {
      print('make get error ==> $e');
      throw "An error occurred, please try again";
    }

    return res;
  }

  static void makePOST(String route, Map<String, dynamic> body,
      {required Function(http.Response) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }
      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);

      http.Response res = await http.post(str, headers: headers, body: json);
      onResponse(res);
    } catch (e) {
      print('make post error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<http.Response?> makePOSTF(String route, Map<String, dynamic> body,
      [String baseUrl = ""]) async {
    http.Response? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }
      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);

      res = await http.post(str, headers: headers, body: json);
    } catch (e) {
      print('make post error ==> $e');
      throw "An error occurred, please try again";
    }
    return res;
  }

  static void makeDELETE(String route,
      {required Function(http.Response) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      http.Response res = await http.get(str, headers: headers);
      onResponse(res);
    } catch (e) {
      print('make delete error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<http.Response?> makeDELETEF(String route, [String baseUrl = ""]) async {
    http.Response? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      res = await http.get(str, headers: headers);
    } catch (e) {
      print('make delete error ==> $e');
      throw "An error occurred, please try again";
    }

    return res;
  }

  static void makePUT(String route, Map<String, dynamic> body,
      {required Function(http.Response) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);

      http.Response res = await http.post(str, headers: headers, body: json);
      onResponse(res);
    } catch (e) {
      print('make put error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<http.Response?> makePUTF(String route, Map<String, dynamic> body,
      [String baseUrl = ""]) async {
    http.Response? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);
      res = await http.post(str, headers: headers, body: json);
    } catch (e) {
      print('make put error ==> $e');
      throw "An error occurred, please try again";
    }

    return res;
  }

  static void makePATCH(String route, Map<String, dynamic> body,
      {required Function(http.Response) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);

      http.Response res = await http.patch(str, headers: headers, body: json);
      onResponse(res);
    } catch (e) {
      print('make patch error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<http.Response?> makePATCHF(String route, Map<String, dynamic> body,
      [String baseUrl = ""]) async {
    http.Response? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }
      Uri str = Uri.parse(baseUrl != "" ? baseUrl : url + route);

      var token = '';

      var headers = {
        'Content-Type': 'application/json',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String json = jsonEncode(body);
      res = await http.patch(str, headers: headers, body: json);
    } catch (e) {
      print('make patch error ==> $e');
      throw "An error occurred, please try again";
    }
    return res;
  }

  static void uploadImage(String route, XFile file,
      {required Function(Response<dynamic>?) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      var token = '';

      var headers2 = {
        // 'Content-Type': 'multipart/form-data',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String uri = baseUrl != "" ? baseUrl : url + route;

      String fileName = file.path.split("/").last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path,
            filename: fileName, contentType: MediaType("image", "jpg")),
      });

      var options = BaseOptions(headers: headers2);
      Dio dio = Dio(options);

      var res = await dio.post(uri, data: formData);

      onResponse(res);
    } catch (e) {
      print('make patch error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<Response<dynamic>?> uploadImageF(String route, XFile file, [String baseUrl = ""]) async {
    Response<dynamic>? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }

      var token = '';

      var headers2 = {
        // 'Content-Type': 'multipart/form-data',
        'usertype': 'customer',
        'Authorization': 'Bearer ' + token
      };

      String uri = baseUrl != "" ? baseUrl : url + route;

      String fileName = file.path.split("/").last;

      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path,
            filename: fileName, contentType: MediaType("image", "jpg")),
      });

      var options = BaseOptions(headers: headers2);
      Dio dio = Dio(options);

      res = await dio.post(uri, data: formData);
    } catch (e) {
      print('make patch error ==> $e');
      throw "An error occurred, please try again";
    }
    return res;
  }

  static void uploadForm(String route, List<XFile> files, Map<String, dynamic> fields,
      {required Function(Response<dynamic>?) onResponse,
      required Function(String) onError,
      String baseUrl = ""}) async {
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          onError("Please check your internet connection");
          return;
        }
      }

      var token = '';

      var headers2 = {
        // 'Content-Type': 'multipart/form-data',
        'usertype': 'provider',
        'Authorization': 'Bearer ' + token
      };

      String uri = baseUrl != "" ? baseUrl : url + route;

      List<String> filepath = [];
      List<String> filenames = [];

      for (XFile file in files) {
        filepath.add(file.path);
        String fileName = file.path.split("/").last;
        filenames.add(fileName);
      }

      FormData formData = FormData();
      int i = 0;
      for (String file in filepath) {
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(file,
                  filename: filenames[i], contentType: MediaType("image", "jpg"))),
        ]);
        ++i;
      }

      List<String> keys = [];
      fields.keys.forEach((key) {
        keys.add(key);
      });

      for (String k in keys) {
        formData.fields.addAll([MapEntry(k, fields[k])]);
      }

      var options = BaseOptions(headers: headers2);
      Dio dio = Dio(options);

      var res = await dio.post(uri, data: formData);

      onResponse(res);
    } catch (e) {
      print('make patch error ==> $e');
      onError("An error occurred, please try again");
    }
  }

  static Future<Response<dynamic>?> uploadFormF(String route, List<XFile> files, Map<String, dynamic> fields,
      [String baseUrl = ""]) async {
    Response<dynamic>? res;
    try {
      if (!debugMode) {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.none) {
          throw "Please check your internet connection";
        }
      }

      var token = '';

      var headers2 = {
        // 'Content-Type': 'multipart/form-data',
        'usertype': 'provider',
        'Authorization': 'Bearer ' + token
      };

      String uri = baseUrl != "" ? baseUrl : url + route;

      List<String> filepath = [];
      List<String> filenames = [];

      for (XFile file in files) {
        filepath.add(file.path);
        String fileName = file.path.split("/").last;
        filenames.add(fileName);
      }

      FormData formData = FormData();
      int i = 0;
      for (String file in filepath) {
        formData.files.addAll([
          MapEntry(
              "file",
              await MultipartFile.fromFile(file,
                  filename: filenames[i], contentType: MediaType("image", "jpg"))),
        ]);
        ++i;
      }

      List<String> keys = [];
      fields.keys.forEach((key) {
        keys.add(key);
      });

      for (String k in keys) {
        formData.fields.addAll([MapEntry(k, fields[k])]);
      }

      var options = BaseOptions(headers: headers2);
      Dio dio = Dio(options);

      res = await dio.post(uri, data: formData);
    } catch (e) {
      print('make patch error ==> $e');
      throw "An error occurred, please try again";
    }
    return res;
  }
}
