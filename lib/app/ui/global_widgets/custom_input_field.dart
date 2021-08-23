import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final String? errorText;
  final TextInputType? inputype;
  final bool isPassword;

  const CustomInputField({
    Key? key,
    this.onChanged,
    required this.label,
    required this.errorText,
    this.inputype,
    this.isPassword = false,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        autovalidateMode: AutovalidateMode.always,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                obscureText: _obscureText,
                keyboardType: widget.inputype,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                    errorText: widget.errorText,
                    labelText: widget.label,
                    border: const OutlineInputBorder(),
                    suffixIcon: widget.isPassword
                        ? CupertinoButton(
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              _obscureText = !_obscureText;
                              setState(() {});
                            })
                        : Container(width: 0)),
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
}
