import 'package:http/http.dart' as http;


import 'dart:convert';
import 'dart:io';


import '../untils/local/SharedPrefs.dart';
import 'appConstant.dart';

class ApiServices {
  final String apiBaseUri;

  ApiServices(this.apiBaseUri);

  Future<dynamic> get(String url) async {
    var apiUrl = Uri.parse(apiBaseUri + url);

    try {
      final response = await http.get(apiUrl);
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Failed to make GET request: $e");
    }
  }

  Future<dynamic> getWithparams(String url, String type) async {
    var apiUrl = Uri.parse('$apiBaseUri$url?type=$type');
    try {
      final response = await http.get(apiUrl);
      //var data = json.decode(response.body);
      //notificationRedirection(data);
      return response; // Return response body
    } catch (e) {
      throw Exception("Failed to make GET request: $e");
    }
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    try {
      var response = await http.post(apiUrl, body: body);
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Failed to make POST request: $e");
    }
  }

  Future<dynamic> getWithUrl(String fullUrl) async {
    try {
      final response = await http.get(Uri.parse(fullUrl));
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      // CommonUtility.showSnackbarValidationError("Getting Server error ${e}");

      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> getWithUrlzpp() async {
    try {
      final response = await http.get(Uri.parse(apiBaseUri));
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
     // CommonUtility.showSnackbarValidationError("Getting Server error ${e}");

      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> postWithBody(String url, Map<String, dynamic> body) async {
    try {
      var apiUrl = Uri.parse(apiBaseUri + url);
      print(apiUrl);
      final response = await http.post(apiUrl, body: body);
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> postWithoutBody(String url) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    Map<String, String> headers = {
      // 'Content-Type':'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
    try {
      final response = await http.post(apiUrl, headers: headers);
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> newpostWithBody(String url, Map<String, dynamic> body) async {
    try {
      var apiUrl = Uri.parse(apiBaseUri + url);
      print("CODE IS RUNNING HERE");
      print(apiUrl);
      final response = await http.post(apiUrl, body: body);
      return response;
    } catch (e) {
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> multiPartOnlyImage(image, url) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    var request = http.MultipartRequest('POST', apiUrl);

    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    // Add file to request
    request.files.add(http.MultipartFile.fromBytes(
      'profile_pic',
      File(image.path).readAsBytesSync(),
      filename: image.path.split("/").last,
    ));
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  Future<dynamic> postbodywithheader(
      String url, Map<String, dynamic> body) async {
    var apiUrl = Uri.parse(apiBaseUri + url);

    Map<String, String> headers = {
      // 'Content-Type':'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
    print(headers);
    print("SENDING FOR $apiUrl\n");
    print(body);
    print("\n\n");
    try {
      final response = await http.post(
        apiUrl,
        body:body,
        headers: headers,
      );
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> getWithHeaders(String url) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    print(apiUrl);
    Map<String, String> headers = {
      //'Content-Type':'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken"),
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
    print(headers);
    try {
      final response = await http.get(apiUrl, headers: headers);
      var data = json.decode(response.body);
      notificationRedirection(data);
      return response;
    } catch (e) {
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> postbodywithheaderfff(String url, dd) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    print(apiUrl);
    Map<String, String> headers = {
      //'Content-Type':'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
//print(json.encode(dd));
    print("++++++++++++++++++CHECK HERE++++++++++++++++++++\n");
    print(dd);
    print("++++++++++++++++++CHECK HERE++++++++++++++++++++\n");

    try {
      final response = await http.post(
        apiUrl,
        body: dd,
        headers: headers,
      );
      var data = json.decode(response.body);
      notificationRedirection(data);
      print(response.body);
      return response;
    } catch (e) {
      pragma("IN ERRERERERERE");
      print(e);
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> postbodywithheaderfffwithcontenttyep(String url, dd) async {
    var apiUrl = Uri.parse(apiBaseUri + url);
    print(apiUrl);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
//print(json.encode(dd));
    print("++++++++++++++++++CHECK HERE++++++++++++++++++++\n");
    print(dd);
    print("++++++++++++++++++CHECK HERE++++++++++++++++++++\n");

    try {
      final response = await http.post(
        apiUrl,
        body: dd,
        headers: headers,
      );
      var data = json.decode(response.body);
      notificationRedirection(data);
      print(response.body);
      return response;
    } catch (e) {
      pragma("IN ERRERERERERE");
      print(e);
      throw Exception("Something goes wrong");
    }
  }

  Future<dynamic> getWithToken(String url) async {
    Map<String, String> headers = {
      //'Content-Type':'application/json',
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken"),
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    };
    var apiUrl = Uri.parse(
      apiBaseUri + url,
    );

    try {
      final response = await http.get(apiUrl, headers: headers);
      return response;
    } catch (e) {
      throw Exception("Failed to make GET request: $e");
    }
  }

  Future<dynamic> multiPartImageWithFieldData({
    File? image,
    required String url,
    required String level,
    required String name,
    required String brand,
    required String quantity,
    String? notes,
    required String total,
    required String type,
    required String served,
    required String abv,
    required String proof,
    required String notSure,
    required String age,
    required String typeOther,
    required String bottle,
    required String batch,
    required String price,
    required String purchasedOn,
    required String rating,
    required String isinWishlist,
    required String reason,
  }) async {
    var apiUrl = Uri.parse(AppConstant.BASE_URL + url);
    var request = http.MultipartRequest('POST', apiUrl);

    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    print(request.headers);

    // Add file to request
    if (image != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'bottle',
        File(image.path).readAsBytesSync(),
        filename: image.path.split("/").last,
      ));
    }

    if (typeOther != '') {
      request.fields.addAll({
        'type_other': typeOther,
      });
    }

    // Add fields to request body
    request.fields.addAll({
      'level': level,
      'name': name,
      'brand': brand,
      'quantity': quantity,
      'total': total,
      'type': type,
      'abv': abv,
      'reason': reason,
      'served': served,
      'is_wishlist': isinWishlist,
      'proof': proof,
      'age': age,
      'bottle': bottle,
      'notes': notes ?? '',
      'batch': batch,
      'price': price,
      'purchased_on': purchasedOn,
      'rating': rating,
      'not_sure': notSure,
    });

    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  Future<dynamic> multiPartImageWithFieldDataEditBottle({
    File? image,
    required String url,
    required String level,
    required String name,
    required String brand,
    required String quantity,
    required String total,
    required String type,
    required String served,
    required String abv,
    required String proof,
    required String age,
    required String bottle,
    String? notes,
    String? typeOther,
    required String batch,
    required String price,
    required String purchasedOn,
    required String rating,
    required String notSure,
    required String bottleId,
    required String isinWishlist,
    required String reason,
  }) async {
    var apiUrl = Uri.parse(AppConstant.BASE_URL + url);
    var request = http.MultipartRequest('POST', apiUrl);

    print(apiUrl);
    print(served);
    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    print(request.headers);

    // Add file to request
    if (image != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'bottle',
        File(image.path).readAsBytesSync(),
        filename: image.path.split("/").last,
      ));
    }

    if (typeOther != '') {
      request.fields.addAll({
        'type_other': typeOther ?? '',
      });
    }

    // Add fields to request body
    request.fields.addAll({
      'level': level,
      'name': name,
      'brand': brand,
      'quantity': quantity,
      'total': total,
      'type': type,
      'abv': abv,
      'notes': notes ?? '',
      'proof': proof,
      'bottleId': bottleId,
      'reason': reason,
      'served': served,
      'is_wishlist': isinWishlist,
      'age': age,
      'not_sure': notSure,
      'bottle': bottle,
      'batch': batch,
      'price': price,
      'purchased_on': purchasedOn,
      'rating': rating,
    });

    print(request.fields);
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  Future<dynamic> fillLevelEditBottle({
    required String url,
    required String level,
    required String isinWishlist,
    required String bottleId,
  }) async {
    var apiUrl = Uri.parse(AppConstant.BASE_URL + url);
    var request = http.MultipartRequest('POST', apiUrl);

    print(apiUrl);

    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    print(request.headers);

    // Add fields to request body
    request.fields.addAll({
      'level': level,
      'bottleId': bottleId,
      'is_wishlist': isinWishlist,
    });

    print(request.fields);
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  Future<dynamic> multiPartImageWithFieldDatacreatecollection({
    File? image,
    required String url,
    required String shelfs,
    required String name,
  }) async {
    var apiUrl = Uri.parse(AppConstant.BASE_URL + url);
    var request = http.MultipartRequest('POST', apiUrl);
    print(apiUrl);
    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    print(request.headers);

    // Add file to request
    if (image != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'collection',
        File(image.path).readAsBytesSync(),
        filename: image.path.split("/").last,
      ));
    }

    // Add fields to request body
    request.fields.addAll({
      'shelfs': shelfs,
      'name': name,
    });

    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  Future<dynamic> multiPartImageWithFieldDataUpdatecollection(
      {File? image,
      required String url,
      required String shelfs,
      required String name,
      required String collectionId}) async {
    var apiUrl = Uri.parse(AppConstant.BASE_URL + url);
    var request = http.MultipartRequest('POST', apiUrl);
    print(apiUrl);
    // Set headers
    request.headers.addAll({
      'Authorization':
          AppConstant.BEARER + SharedPrefs.getString("accesstoken")!,
      'x-csrf-token': SharedPrefs.getString("xcrftoken") ?? "",
    });

    print(request.headers);

    // Add file to request
    if (image != null) {
      request.files.add(http.MultipartFile.fromBytes(
        'collection',
        File(image.path).readAsBytesSync(),
        filename: image.path.split("/").last,
      ));
    }

    // Add fields to request body
    request.fields
        .addAll({'shelfs': shelfs, 'name': name, 'collectionId': collectionId});

    print(request.fields);
    try {
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Result: ${response.body}");

      if (response.statusCode == 400) {
        print(response);
        return "null";
      } else {
        return response;
      }
    } catch (e) {
      print("Error: $e");
      return "null";
    }
  }

  notificationRedirection(
    jsondata,
  ) {
    var accessToken = SharedPrefs.getString('accesstoken');
    if (accessToken != null && accessToken != '') {
      var data = jsondata['code'];
      print("data data data data data data data  $data");
      switch (data) {
        case 410:
          logout();
          break;
        case 401:
          logout();
          break;
      }
    }
  }

  logout() {
    //Utils().unSubscribeTopic();
    SharedPrefs.remove("email");
    SharedPrefs.remove("username");
    SharedPrefs.remove("lastName");
    SharedPrefs.remove("isSocialLogin");
    SharedPrefs.remove("isCollectionisEmpty");
    SharedPrefs.remove("xcrftoken");
    SharedPrefs.remove("refreshToken");
    SharedPrefs.remove("accesstoken");
    SharedPrefs.remove("profilecomplete");
    SharedPrefs.remove("screenName");
    SharedPrefs.remove('avatar');
   // Get.offAll(Login());
  }
}
