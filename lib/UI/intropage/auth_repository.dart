import 'package:flutter_timezone/flutter_timezone.dart';

import '../../webfile/apiservices.dart';
import '../../webfile/appConstant.dart';

class AuthRepository {
  static Future<dynamic> login(String email, String password) async {
    try {
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();

      var response = await ApiServices(AppConstant.BASE_URL).post(
        AppConstant.LOGIN,
        {
          "email": email,
          "password": password,
          "timezone": '${currentTimeZone}',
        },
      );
      return response;
    } catch (e) {
      return "An error occurred during login: $e";
    }
  }

  static Future<dynamic> socialLlogin(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).post(
        AppConstant.SOCIAL_LOGIN,
        body,
      );
      print(body);
      print(AppConstant.BASE_URL + AppConstant.SOCIAL_LOGIN);
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during login: $e";
    }
  }

  static Future<dynamic> register(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).post(
        AppConstant.REGISTER,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> verifyEmail(String email) async {
    try {
      var url = AppConstant.BASE_URL + AppConstant.CHECKEMAIL + "?email=$email";
print(url.toString());
      var response = await ApiServices(AppConstant.BASE_URL).getWithUrl(url);
print(response.toString());
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> verifyOtp(String email, otp, url) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL)
          .postWithBody(url, {"otp": otp, "email": email});
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> forgotPasswrod(String email, url) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).newpostWithBody(
        url,
        {"email": email},
      );

      return response;
    } catch (e) {
      return "An error occurred during login: $e";
    }
  }

  static Future<dynamic> imageUpload(image, url) async {
    try {
      print("CAMERA IMAGEE");
      var response = await ApiServices(AppConstant.BASE_URL)
          .multiPartOnlyImage(image, url);
      print(response);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  //String url, Map<String, dynamic> body, Map<String, String> headers
  static Future<dynamic> updateProfile(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.COMPLETEUSERPROFILE,
        body,
      );
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getStateList(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.STATELIST,
        body,
      );
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getCityList(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.CITYLIST,
        body,
      );
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getCITYBYZIPCODE(Map<String, dynamic> body) async {
    print("SDF DSF DSF $body");
    print("==== getCITYBYZIPCODE getCITYBYZIPCODE getCITYBYZIPCODE getCITYBYZIPCODE");
    try {
      print("==== getCITYBYZIPCODE getCITYBYZIPCODE ${body}} getCITYBYZIPCODE");

      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.ZIPCODE,
        body,
      );
      print('${AppConstant.BASE_URL}${AppConstant.ZIPCODE}');
      print("<><><><><><><><><><><><><><><><><><><><><><><>");
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> deactivarteAccount(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.DEACTIVATE,
        body,
      );

      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> refreshToken({data}) async {
    try {
      print("CALLING add To refreshToken");
      print(data);
      dynamic response = await ApiServices(AppConstant.BASE_URL).post(
        AppConstant.REFRESHTOKEN,
        data,
      );

      print(AppConstant.BASE_URL + AppConstant.REFRESHTOKEN);
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> deleteAccount(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.DELETEACCOUNT,
        body,
      );

      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> removeFollower(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.REMOVEFOLLOWER,
        body,
      );

      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> removeFollowing(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.REMOVEFOLLOWING,
        body,
      );

      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> updateProfilde(data) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL)
          .postbodywithheaderfffwithcontenttyep(
        AppConstant.COMPLETEUSERPROFILE,
        data,
      );
      print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> resetpassword(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).post(
        AppConstant.RESETPASSWORD,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> uplatePreference(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.USERPREFERENCE,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> changePassword(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.CHANGEPASSWORD,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> contactUs(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.CONTACTUS,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getUserListTaste(Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.USERTRASTEPREF,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> followerFollowingList(
      Map<String, dynamic> body) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.FOLLWERFOLLWINGLIST,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getPreferenceList() async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).getWithHeaders(
        AppConstant.USERPREFERENCE,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> dynamicListttt() async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).getWithHeaders(
        AppConstant.DYNAMICLIST,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getProfile() async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).getWithHeaders(
        AppConstant.GETPROFILE,
      );
      return response;
    } catch (e) {
      print(e);
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getCOuntry() async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL).getWithHeaders(
        AppConstant.COUNTRYLIST,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> followUnFollowUser(
      String userid, String followstatus) async {
    Map<String, dynamic> body = {
      "is_follow": "$followstatus",
      "followTo": "$userid"
    };
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.FOLLOWUNFOLLOW,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> searchUser(keyword) async {
    Map<String, dynamic> body = {
      "page": "1",
      "limit": "20",
      "keyword": "$keyword"
    };
    try {
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.SEARCHUSER,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> searchFilterBottler(Map<String, dynamic> body) async {
    try {
      print(body);
      var response = await ApiServices(AppConstant.BASE_URL).postbodywithheader(
        AppConstant.SEARCHFILTERBOTTLE,
        body,
      );
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }
}
