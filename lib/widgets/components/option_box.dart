import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/mock_exma_provider.dart';

class OptionBox extends StatefulWidget {
  const OptionBox(this.boxId,
      {Key? key,
      this.optionData,
      this.onTap,
      this.questionIndex,
      this.categoryName})
      : super(key: key);

  final String? categoryName;
  final int? questionIndex;
  final String? optionData;
  final int boxId;
  final VoidCallback? onTap;

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox>
// with AutomaticKeepAliveClientMixin

//  it is done to keep the sate of a pageview and go to next page and come back to the same page and the state is still there

{
  @override
  Widget build(BuildContext context) {
    return Consumer<ExamProvider>(
      builder: (context, quizProvider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: quizProvider.getOptionUtils[widget.categoryName]![
                              'selectedOption']![widget.questionIndex!] ==
                          widget.boxId
                      ? Colors.indigoAccent
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.optionData!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: quizProvider.getOptionUtils[widget.categoryName]![
                                  'selectedOption']![widget.questionIndex!] ==
                              widget.boxId
                          ? Colors.white
                          : Colors.black,
                      fontSize: 18,
                      fontFamily: "Sofia"),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
