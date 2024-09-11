
import 'package:whiskey_with_bloc/untils/local/SharedPrefs.dart';

class PreferenceManger {
  static const String changeThemee = "changeThemee";

  changeTheme(bool? notify) {
    SharedPrefs.setBool(changeThemee, notify??false);
  }

  getTheme() {
    return  SharedPrefs.getBool(changeThemee);
  }

}
