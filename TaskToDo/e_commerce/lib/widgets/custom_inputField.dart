import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final Function(String) onPressed;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;
  final Icon icon;
  CustomInputField({this.hintText, this.onPressed, this.icon, this.onChanged, this.onSubmitted, this.focusNode, this.textInputAction, this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          obscureText: _isPasswordField,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIcon: icon,
            border: InputBorder.none,
            hintText: hintText ?? 'HintText...',
            contentPadding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            hintStyle: TextStyle(color: Colors.black45, fontWeight: FontWeight.w400),
          ),
            style: Constants.regularDarkText
        ));
  }
}
