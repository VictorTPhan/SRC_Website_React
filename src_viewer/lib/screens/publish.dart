import 'package:anim_search_app_bar/anim_search_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:src_viewer/classes/SpreadsheetFetcher.dart';
import 'package:src_viewer/widgets/LessonApprovalWidget.dart';
import 'dart:html' as html;

import '../classes/LessonEntry.dart';
import '../misc.dart';
import '../widgets/LessonEntryWidget.dart';

class PublishingPage extends StatefulWidget {
  const PublishingPage({super.key});

  @override
  State<PublishingPage> createState() => _PublishingPageState();
}

class _PublishingPageState extends State<PublishingPage> {
  TextEditingController filterQuery = TextEditingController();

  var fetchResponse;

  @override
  void initState() {
    super.initState();
    fetchResponse = SpreadsheetFetcher().fetchSubmissions();
  }

  @override
  Widget build(BuildContext context) {
    int delayMilliSeconds = 75;
    int currentDelay = 0;

    return Scaffold(
      body: Column(
        children: [
          AnimSearchAppBar(
            cancelButtonText: "Cancel",
            hintText: 'Search for a specific assignment with a keyword',
            cSearch: filterQuery,
            onChanged: (String entry) {
              setState(() {

              });
            },
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                "Approve Submitted Material",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchResponse,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) { // Successfully loaded data
                  String responseBody = snapshot.data!;
                  if (responseBody != null) {
                    List<LessonEntry> entries = SpreadsheetFetcher().parseResponse(responseBody);
                    if (entries.isEmpty) {
                      return const Text(
                        "There are no submitted materials available at the moment.",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      );
                    }
                    return ListView.builder( // Once posts are retrieved, generates ListView
                      itemCount: entries.length,
                      itemBuilder: (BuildContext context, int index) {
                        //can we perform an actual filter?
                        if (filterQuery.text.isNotEmpty && !entries[index].matchesQuery(filterQuery.text)) {
                          return const SizedBox.shrink();
                        }
                        else {
                          currentDelay+=delayMilliSeconds;
                          return FadeInLeft(
                              delay: Duration(milliseconds: currentDelay),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15, left: 15, right: 1),
                                child: LessonApprovalWidget(entry: entries[index]),
                              )
                          );
                        }
                      },
                    );
                  } else { // Problem loading data
                    return const Text("Error loading data");
                  }
                } else { // Loading data
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.black, size: 75),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String url = formURL;
          html.window.open(url, "Submission Form");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
