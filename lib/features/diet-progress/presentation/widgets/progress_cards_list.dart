import 'package:flutter/material.dart';
import 'package:petct/core/resources/strings.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:petct/features/diet-progress/presentation/widgets/progress_card.dart';

class ProgressCardList extends StatefulWidget {
  final ProgressStep currentProgressStep;
  final Function dietNavigation;

  const ProgressCardList(
      {Key key, this.currentProgressStep, this.dietNavigation})
      : super(key: key);
  @override
  _ProgressCardListState createState() => _ProgressCardListState();
}

class _ProgressCardListState extends State<ProgressCardList> {
  @override
  Widget build(BuildContext context) {
    return
        // Progress cards
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Waiting diet card
        ProgressCard(
          item: ProgressItem(
            title: Strings(context).progressPageCardTitlePrepare,
            text: Strings(context).progressPageCardTextPrepare,
            step: ProgressStep.WaitingDiet,
            progressUpdateTime: DateTime.now(),
          ),
          currentProgressStep: widget.currentProgressStep,
          dietNavigation: widget.dietNavigation,
        ),
        //Doing diet card
        ProgressCard(
          item: ProgressItem(
            title: Strings(context).progressPageCardTitleDiet,
            text: Strings(context).progressPageCardTextDiet,
            step: ProgressStep.Diet,
            progressUpdateTime: DateTime.now(),
          ),
          currentProgressStep: widget.currentProgressStep,
        ),
        //Fasting card
        ProgressCard(
          item: ProgressItem(
            title: Strings(context).progressPageCardTitleFasting,
            text: Strings(context).progressPageCardTextFasting,
            step: ProgressStep.Fasting,
            progressUpdateTime: DateTime.now(),
          ),
          currentProgressStep: widget.currentProgressStep,
        ),
        //Ready to exam card
        ProgressCard(
          item: ProgressItem(
            title: Strings(context).progressPageCardTitleDone,
            text: Strings(context).progressPageCardTextDone,
            step: ProgressStep.Exam,
            progressUpdateTime: DateTime.now(),
          ),
          currentProgressStep: widget.currentProgressStep,
        ),
      ],
    );
  }
}
