import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.fillColor = Colors.white,
    this.maxLines = 1,
    this.hintStyle = const TextStyle(color: Colors.grey),
    this.focusColor,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.onChange,
    this.onTap,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.labelName = '',
    this.size,
    this.labelPaddingLeft = 30.0,
    this.labelPaddingRight = 0.0,
    this.labelPaddingTop = 0.0,
    this.labelPaddingBottom = 10.0,
    this.visible = true,
    this.enabledBorderColor = Colors.grey,
    this.focusedBorderColor = Colors.grey,
    this.borderColor = Colors.grey,
    this.readOnly = false,
    this.controller,
    this.widthFocusedBorderColor = 1.0,
    this.labelText,
    this.validator,
  }) : super(key: key);

  final Color borderColor;
  final TextEditingController controller;
  final Color enabledBorderColor;
  final String hintText, errorText;
  final Color fillColor;
  final Color focusColor;
  final Color focusedBorderColor;
  final TextStyle hintStyle;
  final TextInputType keyboardType;
  final String labelName;
  final String labelText;
  final double labelPaddingBottom;
  final double labelPaddingLeft;
  final double labelPaddingRight;
  final double labelPaddingTop;
  final int maxLines;
  final bool obscureText;
  final Function onChange;
  final Function(String) validator;
  final Function onTap;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final Widget prefixIcon;
  final bool readOnly;
  final double size;
  final Widget suffixIcon;
  final bool visible;
  final double widthFocusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: labelName,
          fontSize: size,
          color: Colors.black,
          alignment: Alignment.topLeft,
          paddingLeft: labelPaddingLeft,
          paddingRight: labelPaddingRight,
          paddingTop: labelPaddingTop,
          paddingBottom: labelPaddingBottom,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: paddingTop,
            bottom: paddingBottom,
            left: paddingLeft,
            right: paddingRight,
          ),
          child: Visibility(
            visible: visible,
            child: TextFormField(
              controller: controller,
              readOnly: readOnly,
              cursorColor: Colors.black,
              keyboardType: keyboardType,
              onChanged: onChange,
              onTap: onTap,
              obscureText: obscureText,
              maxLines: maxLines,
              validator: validator,
              // minLines: 1,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: TextStyle(color: Colors.grey[200]),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                errorText: errorText,
                hintText: hintText,
                hintStyle: hintStyle,
                focusColor: focusColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: enabledBorderColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: focusedBorderColor,
                    width: widthFocusedBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                fillColor: fillColor,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
