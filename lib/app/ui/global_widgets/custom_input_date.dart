import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validate_now/app/utils/register_utils/register_validation.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//final df = new DateFormat('dd-MM-yyyy hh:mm a');

class CustomInputDate extends StatefulWidget {
  final void Function()? onTap;
  final String label;
  final String? errorText;

  CustomInputDate({
    Key? key,
    this.onTap,
    required this.label,
    required this.errorText,
  }) : super(key: key);

  @override
  _CustomInputDateState createState() => _CustomInputDateState();
}

class _CustomInputDateState extends State<CustomInputDate> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<RegisterValidation>(context);
    return FormField<String>(
        autovalidateMode: AutovalidateMode.always,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                readOnly: true,
                controller: _controller,
                onTap: () => getFecha(context, validationService),
                decoration: InputDecoration(
                  errorText: widget.errorText,
                  labelText: widget.label,
                  border: const OutlineInputBorder(),
                  suffixIcon: CupertinoButton(
                      child: Icon(Icons.date_range), onPressed: () {}),
                ),
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.redAccent),
                )
            ],
          );
        });
  }

  getFecha(context, validationService) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1920),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        _controller.text = DateFormat('dd-MM-yyyy').format(value);
      }
      validationService.changeDate(_controller.text);
    });
  }
}
