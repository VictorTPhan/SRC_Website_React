import 'package:animate_do/animate_do.dart';
import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
                        entry.activity,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25
                        ),
                      ),
                    ),
                    getFadeInDelayWidget(
                      delayMilliSeconds,
                      Text(
                        "by ${entry.contributorName}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    getFadeInDelayWidget(
                      delayMilliSeconds,
                      Text(
                        "(${entry.contributorEmail})",
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
                    IgnorePointer(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(''),
                          TyperAnimatedText('          ' + entry.description, speed: Duration(milliseconds: 5), textStyle: TextStyle(fontSize: 15.5)),
                        ],
                        pause: Duration(seconds: 1),
                        repeatForever: false,
                        totalRepeatCount: 1,
                      ),
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