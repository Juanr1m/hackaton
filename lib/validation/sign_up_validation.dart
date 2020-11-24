import 'package:cactus_jobs/constants.dart';
import 'package:cactus_jobs/validation/validation_item.dart';
import 'package:flutter/widgets.dart';

class SignUpValidation with ChangeNotifier {
  ValidationItem _emailField = ValidationItem(null, null);
  ValidationItem _passwordField = ValidationItem(null, null);

  // Getters
  ValidationItem get emailField => _emailField;
  ValidationItem get passwordField => _passwordField;

  // Setters

  void changeEmailField(String value) {
    if (emailValidatorRegExp.hasMatch(value)) {
      _emailField = ValidationItem(value, null);
    } else {
      _emailField = ValidationItem(null, "error");
    }
    notifyListeners();
  }

  void changePasswordField(String value) {
    if (value.isEmpty) {
      _passwordField = ValidationItem(null, 'Введите Пароль');
    } else if (value.length < 8) {
      _passwordField =
          ValidationItem(null, 'Пароль должен содержать 8 символов');
    }
    notifyListeners();
  }
}
