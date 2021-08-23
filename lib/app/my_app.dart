import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_validate_now/app/ui/routes/routes.dart';
import 'utils/register_utils/register_validation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RegisterValidation(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.green),
          debugShowCheckedModeBanner: false,
          title: "Form validate now",
          onGenerateRoute: onGenerateRoute,
          initialRoute: Login,
        ));
  }
}
