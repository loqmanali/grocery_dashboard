import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key key,
    this.text,
    this.color,
    this.fontWeight,
    this.fontFamily = 'Almarai',
    this.fontStyle = FontStyle.normal,
    this.fontSize,
    this.textAlign,
    this.alignment = Alignment.center,
    this.letterSpacing,
    this.locale,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.textDecoration,
    this.height,
    this.textBaseline,
    this.overflow,
    this.softWrap,
    this.maxLines,
  }) : super(key: key);

  final Alignment alignment;
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final double height;
  final double letterSpacing;
  final Locale locale;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final String text;
  final TextAlign textAlign;
  final TextBaseline textBaseline;
  final TextDecoration textDecoration;
  final TextOverflow overflow;
  final bool softWrap;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontStyle: fontStyle,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            decoration: textDecoration,
            height: height,
            textBaseline: textBaseline,
          ),
          textAlign: textAlign,
          locale: locale,
          overflow: overflow,
          softWrap: softWrap,
          maxLines: maxLines,
        ),
      ),
      alignment: alignment,
    );
  }
}
