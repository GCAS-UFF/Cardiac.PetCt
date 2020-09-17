import 'package:flutter/material.dart';
import 'package:petct/core/resources/dimensions.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/core/ui/custom_dropdown.dart';
import 'package:petct/core/ui/date_picker_app.dart';
import 'package:petct/core/ui/time_picker_app.dart';
import 'package:petct/features/intro-form/models/exam_details.dart';

class ExamDetailsForm extends StatefulWidget {
  final Function onChange;
  final List<DropdownMenuItem> list;
  final ExamDetails examDetails;

  const ExamDetailsForm({Key key, this.onChange, this.list, this.examDetails})
      : super(key: key);
  @override
  _ExamDetailsFormState createState() => _ExamDetailsFormState();
}

class _ExamDetailsFormState extends State<ExamDetailsForm> {
  String _timeDay;
  DateTime _dateTime;
  String _location;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.examDetails != null) {
      _timeDay = widget.examDetails.examTime.format(context);
      _dateTime = widget.examDetails.examDate;
      _location = widget.examDetails.examLocation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
          margin: Dimensions.getEdgeInsets(context, bottom: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: Dimensions.getConvertedWidthSize(context, 1),
                color: Colors.grey,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              // Date title
              Text(
                Strings(context).dateTimeExam,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 20),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Date Picker Field
            DatePickerApp(
              value: _dateTime,
              onChange: (DateTime date) {
                setState(() {
                  _dateTime = date;
                  widget.onChange(date);
                });
              },
            ),
            // Time Picker Field
            TimePickerApp(
              label: Strings(context).hourLabel,
              value: _timeDay,
              onChange: (TimeOfDay time) {
                setState(() {
                  _timeDay = time.format(context);
                  widget.onChange(time);
                });
              },
            )
          ],
        ),
        Container(
          padding: Dimensions.getEdgeInsets(context, bottom: 10, left: 30),
          margin: Dimensions.getEdgeInsets(context, top: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: Dimensions.getConvertedWidthSize(context, 1),
                color: Colors.grey,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              // Exam Location Title
              Text(
                Strings(context).examLocation,
                style: TextStyle(
                  fontSize: Dimensions.getTextSize(context, 20),
                ),
              ),
            ],
          ),
        ),
        // Local Dropdown Field
        Padding(
          padding: Dimensions.getEdgeInsetsFromLTRB(context, 25, 30, 25, 20),
          child: CustomDropdown(
            hint: Text(Strings(context).localLabel),
            value: _location,
            options: widget.list,
            onChange: (String value) {
              setState(() {
                _location = value;
                widget.onChange(value);
              });
            },
          ),
        ),
      ],
    );
  }
}
