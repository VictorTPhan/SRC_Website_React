import 'package:animate_do/animate_do.dart';
import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:src_viewer/LessonEntry.dart';
import 'package:src_viewer/LessonEntryDetailWidget.dart';
import 'dart:html' as html;

class LessonEntryWidget extends StatelessWidget {
  LessonEntry entry;
  LessonEntryWidget({super.key, required this.entry});
  int currentDelay = 0;

  int increaseCurrentDelay(int byMilliSeconds) {
    return currentDelay+=byMilliSeconds;
  }

  Widget getFadeInDelayWidget(int delay, Widget child) {
    return FadeIn(
        delay: Duration(milliseconds: increaseCurrentDelay(delay)),
        child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    int delayMilliSeconds = 200;

    return InkWell(
      onTap: () {
        AwesomeDialog(
          context: context,
          animType: AnimType.leftSlide,
          dialogType: DialogType.noHeader,
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: LessonEntryDetailWidget(entry: entry),
          ),
          btnOkText: "Download",
          btnOkIcon: Icons.download,
          btnOkOnPress: () {
            html.window.open(entry.fileSubmission, "Download");
          },
          btnCancelText: "Back",
          btnCancelColor: Colors.grey,
          btnCancelIcon: Icons.arrow_back,
          btnCancelOnPress: () {

          }
        ).show();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              getFadeInDelayWidget(
                delayMilliSeconds,
                Text(
                  entry.activity,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              getFadeInDelayWidget(
                delayMilliSeconds,
                Text(
                  "by ${entry.contributorName}\t(${entry.contributorEmail})",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              getFadeInDelayWidget(
                delayMilliSeconds,
                Text(entry.description, overflow: TextOverflow.ellipsis,)
              ),
            ],
          ),
        ),
      ).increaseSizeOnHover(1.05, duration: Duration(milliseconds: 150)),
    );
  }
}