import 'package:flutter/cupertino.dart';
import 'package:form_validate_now/app/utils/register_utils/name_validator.dart';
import '../validation/validation_item.dart';
import 'email_validator.dart';

class RegisterValidation with ChangeNotifier {
  //----------------variables----------------------------//
  ValidationItem _firstName = ValidationItem(null, null);
  ValidationItem _lastName = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _dateBirth = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _vPassword = ValidationItem(null, null);
  //----------------variables----------------------------//

  //Getters
  ValidationItem get firstName => _firstName;
  ValidationItem get lastName => _lastName;
  ValidationItem get email => _email;
  ValidationItem get dateBirth => _dateBirth;
  ValidationItem get password => _password;
  ValidationItem get vpassword => _vPassword;

  bool get isValid {
    if (_firstName.value != null &&
        _lastName.value != null &&
        _email.value != null &&
        _dateBirth.value != null &&
        _password.value != null &&
        _vPassword.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeFirstName(String value) {
    if (isValidName(value)) {
      _firstName = ValidationItem(value, null);
    } else {
      _firstName = ValidationItem(null, "Invalid first name");
    }
    notifyListeners();
  }

  void changeLastName(String value) {
    if (isValidName(value)) {
      _lastName = ValidationItem(value, null);
    } else {
      _lastName = ValidationItem(null, "Invalid last name");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    if (isValidEmail(value)) {
      _email = ValidationItem(value, null);
    } else {
      _email = ValidationItem(null, "Invalid email");
    }
    notifyListeners();
  }

  void changeDate(String value) {
    if (_dateBirth.value != null || value != "") {
      _dateBirth = ValidationItem(value, null);
    } else {
      _dateBirth = ValidationItem(null, "Invalid email");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    changeVPassword(value);
    if (value.trim().length >= 6) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Invalid password");
    }

    notifyListeners();
  }

  void changeVPassword(String value) {
    if (_password.value != value) {
      _vPassword = ValidationItem(null, "password does not match");
    } else {
      _vPassword = ValidationItem(value, null);
    }

    notifyListeners();
  }

  void submitData() {
    print(
        "FirstName: ${firstName.value}, LastName: ${lastName.value}, Email: ${email.value} , Password ${password.value}, date: ${dateBirth.value}");
  }
}
