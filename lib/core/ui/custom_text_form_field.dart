import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/input_validators/base_input_validator.dart';
import 'package:petct/core/input_validators/empty_input_validator.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String text;
  final BaseInputValidator validator;
  final bool isRequired;
  final Function onChanged;
  final Function onFieldSubmitted;
  final int maxLength;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final bool filled;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color lineColorSelected;
  final Color lineColorUnselected;
  final int maxLines;

  CustomTextFormField({
    this.textEditingController,
    this.text,
    this.maxLength,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.isRequired = false,
    this.obscureText = false,
    this.filled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.lineColorSelected,
    this.lineColorUnselected,
    this.maxLines = 1,
  });

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFormFieldState();
  }
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String _validate(BuildContext context, String value) {
    if (widget.isRequired != null && widget.isRequired) {
      String message = EmptyInputValidator().validate(context, value);
      if (message != null) return message;
    }

    if (widget.validator != null) {
      return widget.validator.validate(context, value);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.montserrat(
        fontSize: Dimensions.getTextSize(context, 16),
      ),
      controller: widget.textEditingController,
      textAlign: widget.textAlign,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      autovalidate: false,
      textCapitalization: widget.textCapitalization,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.montserrat(
          fontSize: Dimensions.getTextSize(context, 16),
        ),
        suffixIcon: widget.suffixIcon,
        labelStyle: GoogleFonts.montserrat(
          fontSize: Dimensions.getTextSize(context, 16),
          color:ColorsApp.greenApp,
          fontWeight: FontWeight.w600,
        ),
        labelText: widget.text,
        contentPadding: Dimensions.getEdgeInsetsAll(context, 10),
        hoverColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          gapPadding: Dimensions.getConvertedWidthSize(context, 5.0),
          borderSide: BorderSide(
            color: ColorsApp.greenApp,
            width: Dimensions.getConvertedWidthSize(context, 2.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: Dimensions.getConvertedWidthSize(context, 2.0),
          borderSide: BorderSide(
            width: Dimensions.getConvertedWidthSize(context, 1.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: Dimensions.getConvertedWidthSize(context, 2.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimensions.getConvertedWidthSize(context, 1.0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: Dimensions.getConvertedWidthSize(context, 2.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: Dimensions.getConvertedWidthSize(context, 1.0),
          ),
        ),
        errorStyle: GoogleFonts.montserrat(
          color: Colors.red,
          fontSize: Dimensions.getTextSize(context, 12.0),
        ),
      ),
      validator: (value) {
        return _validate(context, value);
      },
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLines: widget.maxLines,
    );
  }
}
