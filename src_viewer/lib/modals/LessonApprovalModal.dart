import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:src_viewer/classes/LessonEntry.dart';

import '../misc.dart';
import 'LessonEntryModal.dart';

class LessonApprovalModal extends LessonEntryModal {
  LessonApprovalModal({super.key, required super.entry});

  List<String> info = fieldsToShowInTableForPublishing;

  @override
  Widget determineWidget(String field, String value){
    if (value.isEmpty) {
      return Text("No data provided.");
    }
    switch (field) {
      case "Student Samples":
      case "Instructor's Guide":
      case "File Submission":
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
}

dynamic createLessonApprovalModal(LessonEntry entry, BuildContext context) {
  var url = "https://script.google.com/macros/s/AKfycbxXPb-IBV2vzK8vFcfRi0BA_LTmL_AL5MbA9N76O2RQtARp0kko7weua0cnZ_7sHTWdOA/exec";
  bool approved = entry.getSubmissionField("Approved").value == "APPROVED";

  return AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: LessonApprovalModal(entry: entry),
      ),
      btnOkText: approved? "Delist" : "Approve",
      btnOkIcon: approved? Icons.close : Icons.check,
      btnOkColor: approved? Colors.red : Colors.green,
      btnOkOnPress: () async {
        String name = entry.getSubmissionField("Activity").value;
        String timestamp = entry.getSubmissionField("Upload Date").value;
        String status = approved? "" : "APPROVED";

        Map<String, dynamic> body = {
          "name": name,
          "timestamp": timestamp,
          "status": status
        };

        final response = await http.post(Uri.parse(url), body: body);
        if (response.statusCode == 200) {
          Map<String, dynamic> map = json.decode(response.body);
        } else {
        }
        print("I'm back");
      },
      btnCancelText: "Back",
      btnCancelColor: Colors.grey,
      btnCancelIcon: Icons.arrow_back,
      btnCancelOnPress: () {
      }
  ).show();
}