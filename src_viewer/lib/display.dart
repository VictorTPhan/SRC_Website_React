import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;
import 'package:csv/csv.dart';
import 'package:src_viewer/LessonEntry.dart';
import 'package:src_viewer/LessonEntryLabel.dart';
import 'package:src_viewer/LessonEntryWidget.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  var fetchResponse;
  TextEditingController filterQuery = TextEditingController();

  Future<String> _fetchSubmissions() async {
    print("got called");
    String url = "https://docs.google.com/spreadsheets/d/e/2PACX-1vRfDhofSMr57svLWEdt_bjPXOAk1-1-A0duXVI-Iw9MTCsJi8S9PIsGz-qI9qrSWPkFSsYODmfXwwwV/pub?output=csv";

    final response = await http.get(Uri.parse(url));
    return response.body;
  }

  List<LessonEntry> parseResponse(String responseBody){
    List<List<dynamic>> rows = CsvToListConverter().convert(responseBody);
    List<LessonEntry> output = [];

    //remove the header row
    rows.removeAt(0);

    //I would have used the header row, but Google automatically changes it whenever a new update is made.
    List labels = [
      'timeStamp',
      'activity',
      'contributorEmail',
      'contributorName',
      'description',
      'type',
      'series',
      'societalFactor',
      'courseLevel',
      'csTopic',
      'programmingLanguage',
      'prereqKnowledge',
      'criticalComponents',
      'learningObjectives',
      'preReading',
      'timelimeOfActivities',
      'reflectionActivities',
      'effectiveTeachingMethods',
      'suggestedReadingMaterials',
      'issuesAndSolutions',
      'referencesForInstructor',
      'fileSubmission'
    ];

    for (int i = 0; i<rows.length; i++) {
      var map = Map<String, dynamic>();
      for (int j = 0; j<labels.length; j++) {
        map[labels[j]] = rows[i][j];
      }
      output.add(LessonEntry.fromMap(map));
    }

    print("Response complete");
    return output;
  }

  @override
  void initState() {
    super.initState();
    fetchResponse = _fetchSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    int delayMilliSeconds = 75;
    int currentDelay = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
            "Socially Responsible Computing Curriculum Viewer",
            style: TextStyle(
              color: Colors.white
            ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: "Query"),
                  controller: filterQuery,
                  onChanged: (String entry) {
                    setState(() {

                    });
                  },
                )
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchResponse,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) { // Successfully loaded data
                  String responseBody = snapshot.data!;
                  if (responseBody != null) {
                    List<LessonEntry> entries = parseResponse(responseBody);
                    return ListView.builder( // Once posts are retrieved, generates ListView
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        //can we perform an actual filter?
                        if (filterQuery.text.isNotEmpty && !entries[index].matchesQuery(filterQuery.text)) {
                          print("Filtered out");
                          return SizedBox.shrink();
                        }
                        else {
                          print("Not filtered out");
                          currentDelay+=delayMilliSeconds;
                          return FadeInLeft(
                              delay: Duration(milliseconds: currentDelay),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 1),
                                child: LessonEntryWidget(entry: entries[index]),
                              )
                          );
                        }
                      },
                    );
                  } else { // Problem loading data
                    return const Text("Error loading data");
                  }
                } else { // Loading data
                  return const Text("loading...");
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String url = "https://docs.google.com/forms/d/e/1FAIpQLSdS6PVD6G4Ovbw4SunQWrcZ4YF1twxHVGmfvf4HLWOt0SaAQA/viewform";
          html.window.open(url, "Submission Form");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
