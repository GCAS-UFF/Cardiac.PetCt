import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExamDetails extends Equatable {
  DateTime examDate;
  TimeOfDay examTime;
  String examLocation;

  ExamDetails({
    @required this.examDate,
    @required this.examTime,
    this.examLocation,
  });

  @override
  List<Object> get props => [
        examDate,
        examTime,
        examLocation,
      ];
}
