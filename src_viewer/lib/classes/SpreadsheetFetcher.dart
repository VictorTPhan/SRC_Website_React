import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'LessonEntry.dart';
import '../misc.dart';

class SpreadsheetFetcher {
  //Allows this class to be a singleton.
  static final SpreadsheetFetcher _singleton = SpreadsheetFetcher._internal();
  factory SpreadsheetFetcher() {
    return _singleton;
  }
  SpreadsheetFetcher._internal();

  Future<String> fetchSubmissions() async {
    String url = formFetchURL;

    final response = await http.get(Uri.parse(url));
    return response.body;
  }

  List<LessonEntry> parseResponse(String responseBody, [bool onlyApprovedAllowed = false]){
    List<List<dynamic>> rows = CsvToListConverter().convert(responseBody);
    List<LessonEntry> output = [];

    //remove the header row
    rows.removeAt(0);

    //I would have used the header row, but Google automatically changes it whenever a new update is made.
    List labels = formFields;

    for (int i = 0; i<rows.length; i++) {
      var map = Map<String, dynamic>();
      for (int j = 0; j<labels.length; j++) {
        map[labels[j]] = rows[i][j];
      }
      LessonEntry entry = LessonEntry.fromMap(map);

      if (onlyApprovedAllowed) {
        if (entry.getSubmissionField("Approved").value == "APPROVED") {
          output.add(LessonEntry.fromMap(map));
        }
      } else {
        output.add(LessonEntry.fromMap(map));
      }
    }

    return output;
  }
}