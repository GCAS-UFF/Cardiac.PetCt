import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petct/core/resources/colors.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';

class CustomDropdown extends StatefulWidget {
  final String value;
  final Widget hint;
  final Function onChange;
  final List<DropdownMenuItem<String>> options;

  const CustomDropdown(
      {Key key, this.value, this.onChange, this.options, this.hint})
      : super(key: key);
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintStyle: GoogleFonts.montserrat(
          fontSize: Dimensions.getTextSize(context, 16),
        ),
        contentPadding: Dimensions.getEdgeInsets(context, left: 10, right: 10),
        hoverColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          gapPadding: Dimensions.getConvertedWidthSize(context, 5.0),
          borderSide: BorderSide(
            color: ColorsApp.greenApp,
            width: Dimensions.getConvertedWidthSize(context, 2.0),
          ),
        ),
        fillColor: Colors.grey,
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
          fontSize: Dimensions.getTextSize(context, 11.0),
        ),
      ),
      validator: (value) =>
          value == null ? Strings(context).emptyFieldMessage : null,
      hint: widget.hint,
      isExpanded: true,
      value: widget.value,
      items: widget.options,
      onChanged: widget.onChange,
    );
  }
}
