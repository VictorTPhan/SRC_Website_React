import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:src_viewer/LessonEntry.dart';
import 'package:src_viewer/SubmissionField.dart';

import 'misc.dart';

class LessonEntryModal extends StatelessWidget {
  LessonEntry entry;

  LessonEntryModal({super.key, required this.entry});

  Widget displayTabularFields(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
    DateTime timestamp = dateFormat.parse(entry.fields['Upload Date']!.value);

    List<String> info = fieldsToShowInTable;

    List<DataRow> rows = [];
    int delayMilliSeconds = 75;
    int currentDelay = 0;
    for(String label in info) {
      SubmissionField sF = entry.getSubmissionField(label);

      rows.add(DataRow(cells: [
        DataCell(
            FadeInLeft(
                delay: Duration(milliseconds: currentDelay),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: JustTheTooltip(
                    backgroundColor: Color(0xFF333333),
                    content: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          sF.desc,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                      ),
                    ),
                    child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
            )
        ),
        DataCell(
            FadeInLeft(
                delay: Duration(milliseconds: currentDelay),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: determineWidget(label, sF.value),
                ),
            )
        )
      ]));
      currentDelay+=delayMilliSeconds;
    }

    return DataTable(
        dataRowMaxHeight: double.infinity,
        columns: [
          DataColumn(label: Text("Field", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          DataColumn(label: Text("Response", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))
        ],
        rows: rows
    );
  }

  Widget determineWidget(String field, String value){
    if (value.isEmpty) {
      return Text("No data provided.");
    }
    switch (field) {
      case "Student Samples":
      case "Instructor's Guide":
        return ElevatedButton(
            onPressed: () {
              String url = value;
              html.window.open(url, field);
            },
            child: Text("View Here")
        );
      default:
        return Text(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              entry.getSubmissionField("Activity").value,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "submitted by ",
                ),
                Text(
                  entry.getSubmissionField("Contributor").value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  " ("+entry.getSubmissionField("Contributor Email").value+")",
                  style: TextStyle(
                      fontStyle: FontStyle.italic
                  ),
                ),
              ],
            ),
            Text(
                "       " + entry.getSubmissionField("Description").value,
                style: TextStyle(
                  fontSize: 15.5
                ),
            ),
            displayTabularFields(context),
          ],
        ),
      ),
    );
  }
}

dynamic createLessonEntryModal(LessonEntry entry, BuildContext context) {
  return AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: LessonEntryModal(entry: entry),
      ),
      btnOkText: "Download",
      btnOkIcon: Icons.download,
      btnOkOnPress: () {
        html.window.open(entry.getSubmissionField("File URL").value, "Download");
      },
      btnCancelText: "Back",
      btnCancelColor: Colors.grey,
      btnCancelIcon: Icons.arrow_back,
      btnCancelOnPress: () {

      }
  ).show();
}