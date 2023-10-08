import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:src_viewer/LessonEntry.dart';
import 'package:src_viewer/LessonEntryDetailWidget.dart';

class LessonEntryWidget extends StatelessWidget {
  LessonEntry entry;

  LessonEntryWidget({super.key, required this.entry});

  void ShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LessonEntryDetailWidget(entry: entry),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Go Back")
                        ),
                        ElevatedButton(
                            onPressed: () {
                              html.window.open(entry.fileSubmission, "Download");
                            },
                            child: Text("Download")
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              entry.activity,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "by ${entry.contributorName}\t(${entry.contributorEmail})",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(entry.csTopic),
            Text(entry.description, overflow: TextOverflow.ellipsis,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        ShowDialog(context);
                      },
                      child: Text("See Info")
                  ),
                  ElevatedButton(
                      onPressed: () {
                        html.window.open(entry.fileSubmission, "Download");
                      },
                      child: Text("Download")
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}