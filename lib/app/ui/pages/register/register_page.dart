import 'package:flutter/material.dart';
import 'package:form_validate_now/app/ui/global_widgets/custom_input_date.dart';
import 'package:form_validate_now/app/ui/global_widgets/custom_input_field.dart';
import 'package:form_validate_now/app/utils/register_utils/register_validation.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<RegisterValidation>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              CustomInputField(
                  label: "First Name",
                  errorText: validationService.firstName.error,
                  onChanged: (String value) =>
                      validationService.changeFirstName(value)),
              const SizedBox(
                height: 15,
              ),
              CustomInputField(
                label: "Last Name",
                errorText: validationService.lastName.error,
                onChanged: (String value) =>
                    validationService.changeLastName(value),
              ),
              const SizedBox(height: 15),
              CustomInputField(
                label: "Email",
                errorText: validationService.email.error,
                onChanged: (String value) =>
                    validationService.changeEmail(value),
              ),
              const SizedBox(height: 15),
              CustomInputDate(
                label: "Fecha",
                errorText: validationService.dateBirth.error,
              ),
              const SizedBox(height: 15),
              CustomInputField(
                label: "Password",
                isPassword: true,
                errorText: validationService.password.error,
                onChanged: (String value) =>
                    validationService.changePassword(value),
              ),
              const SizedBox(height: 15),
              CustomInputField(
                label: "Verification Password",
                isPassword: true,
                errorText: validationService.vpassword.error,
                onChanged: (String value) =>
                    validationService.changeVPassword(value),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: (!validationService.isValid)
                      ? null
                      : validationService.submitData,
                  child: const Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
