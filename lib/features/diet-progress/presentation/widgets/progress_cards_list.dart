import 'package:flutter/material.dart';
import 'package:petct/features/diet-progress/presentation/models/progress_item.dart';
import 'package:petct/features/diet-progress/presentation/widgets/progress_card.dart';

class ProgressCardList extends StatefulWidget {
  final ProgressStep currentProgressStep;

  const ProgressCardList({Key key, this.currentProgressStep}) : super(key: key);
  @override
  _ProgressCardListState createState() => _ProgressCardListState();
}

class _ProgressCardListState extends State<ProgressCardList> {
  final ProgressStep _currentProgressSter = ProgressStep.WaitingDiet;
  @override
  Widget build(BuildContext context) {
    return
        // Progress cards
        Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ProgressCard(
          item: ProgressItem(
            title: "Prepare-se para a dieta",
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            status: ProgressStatus.Done,
            step: ProgressStep.WaitingDiet,
          ),
          currentProgressStep: _currentProgressSter,
        ),
        ProgressCard(
          item: ProgressItem(
            title: "Em dieta",
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            status: ProgressStatus.Done,
            step: ProgressStep.Diet,
          ),
          currentProgressStep: _currentProgressSter,
        ),
        ProgressCard(
          item: ProgressItem(
            title: "Em jejum",
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            status: ProgressStatus.Current,
            step: ProgressStep.Fasting,
          ),
          currentProgressStep: _currentProgressSter,
        ),
        ProgressCard(
          item: ProgressItem(
            title: "Exame",
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            status: ProgressStatus.Future,
            step: ProgressStep.Exam,
          ),
          currentProgressStep: _currentProgressSter,
        ),
      ],
    );
  }
}
