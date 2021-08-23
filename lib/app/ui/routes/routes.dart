import 'package:flutter/material.dart';
import 'package:form_validate_now/app/ui/pages/login/login_page.dart';
import 'package:form_validate_now/app/ui/pages/register/register_page.dart';

const String Login = "login";
const String Register = "register";

// Router
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Login:
      return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
    case Register:
      return MaterialPageRoute(
          builder: (BuildContext context) => RegisterPage());
    default:
      return MaterialPageRoute(builder: (BuildContext context) => LoginPage());
  }
}
