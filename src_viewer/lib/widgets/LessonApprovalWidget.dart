import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:src_viewer/modals/LessonApprovalModal.dart';
import 'package:src_viewer/widgets/LessonEntryWidget.dart';
import '../classes/LessonEntry.dart';

class LessonApprovalWidget extends LessonEntryWidget {
  LessonApprovalWidget({super.key, required super.entry});

  @override
  void onWidgetTapped(LessonEntry entry, BuildContext context) {
    createLessonApprovalModal(entry, context);
  }

  Color determineColor() {
    switch(entry.getSubmissionField("Approved").value) {
      case "APPROVED":
        return Color(0xFFC4F5A0);
      case "DENIED":
        return Color(0xFFEC9090);
      default:
        return Color(0xFFB4B4B4);
    }
  }

  @override
  Widget build(BuildContext context) {
    int delayMilliSeconds = 200;

    return InkWell(
      onTap: () {
        onWidgetTapped(entry, context);
      },
      child: Card(
        color: determineColor(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getFadeInDelayWidget(
                      delayMilliSeconds,
                      Text(
                        entry.getSubmissionField("Activity").value,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25
                        ),
                      ),
                    ),
                    getFadeInDelayWidget(
                      delayMilliSeconds,
                      Text(
                        entry.getSubmissionField("Contributor").value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    getFadeInDelayWidget(
                      delayMilliSeconds,
                      Text(
                        entry.getSubmissionField("Contributor Email").value,
                        style: TextStyle(
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 90,
                child: getFadeInDelayWidget(
                    delayMilliSeconds,
                    Row(
                      children: [

                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ).increaseSizeOnHover(1.03, duration: Duration(milliseconds: 150)),
    );
  }
}
