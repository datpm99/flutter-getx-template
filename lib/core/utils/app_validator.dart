import 'package:get/get.dart';

class AppValidator {
  static String? empty(String? val, String label) {
    if (val == null) return null;
    if (val.trim().isEmpty) return 'msg_empty'.trParams({'label': label.tr});
    return null;
  }

  static String? email(String? val) {
    if (val == null) return null;
    if (val.isEmpty) return 'msg_empty'.trParams({'label': 'Email'});
    if (!val.isEmail) return 'msg_invalid'.trParams({'label': 'Email'});
    return null;
  }

  static String? password(String? val, String label) {
    String pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~@#$%^&*+=])[A-Za-z\d~@#$%^&*+=]{8,50}$";
    RegExp regex = RegExp(pattern);

    if (val == null) return null;
    if (val.isEmpty) return 'msg_empty'.trParams({'label': label.tr});
    if (!regex.hasMatch(val)) return 'msg_invalid'.trParams({'label': label.tr});
    return null;
  }
}
