import '../../apiservices.dart';
import '../../appConstant.dart';

class SplashRepository {
  static Future<dynamic> getIntroData() async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL)
          .getWithparams(AppConstant.INTROSCREEN, "intro");

      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }

  static Future<dynamic> getSplashData(type) async {
    try {
      var response = await ApiServices(AppConstant.BASE_URL)
          .getWithparams(AppConstant.INTROSCREEN, "splash");
      //print(response.body);
      return response;
    } catch (e) {
      return "An error occurred during registration: $e";
    }
  }
}
