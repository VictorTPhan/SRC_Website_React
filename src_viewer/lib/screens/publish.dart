import 'package:anim_search_app_bar/anim_search_app_bar.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:src_viewer/classes/RefreshNotifier.dart';
import 'package:src_viewer/widgets/LessonApprovalWidget.dart';

import '../classes/IRefresh.dart';
import '../classes/LessonEntry.dart';

class PublishingPage extends StatefulWidget {
  const PublishingPage({super.key});

  @override
  State<PublishingPage> createState() => _PublishingPageState();
}

class _PublishingPageState extends State<PublishingPage> implements IRefresh{
  TextEditingController filterQuery = TextEditingController();
  final db = FirebaseFirestore.instance;
  bool showUnpublishedSubmissions = true;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?> fetchSubmissions() async {
    Query<Map<String, dynamic>> initialQuery = db.collection("submissions");
    if (showUnpublishedSubmissions) {
      initialQuery = db.collection("submissions").where("Approved", isNotEqualTo: "APPROVED");
    }
    var resultQuery = (await initialQuery.get()).docs;
    if (resultQuery.length == 1) {
      return resultQuery;
    } else {
      initialQuery = initialQuery.orderBy("Timestamp");
      return (await initialQuery.get()).docs;
    }
  }

  @override
  void initState() {
    super.initState();
    RefreshNotifier().addListener(this);
  }

  @override
  void refreshPage(){
    print("refreshing publishing page");
    setState(() {

    });
  }

  void toggleUnpublishedSubmissions() {
    print("toggling");
    setState(() {
      showUnpublishedSubmissions = !showUnpublishedSubmissions;
    });
  }

  @override
  void onPageExited() {
    RefreshNotifier().removeListener(this);
  }

  @override
  Widget build(BuildContext context) {
    int delayMilliSeconds = 75;
    int currentDelay = 0;

    return WillPopScope(
      onWillPop: () async {
        onPageExited();
        return true;
      },
      child: Scaffold(
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
                title: Row(
                  children: [
                    Text(
                      "Approve Submitted Material",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: IconButton(
                          onPressed: () {
                            toggleUnpublishedSubmissions();
                          },
                          icon: const Icon(Icons.filter_list_alt)
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchSubmissions(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) { // Successfully loaded data
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>? submissions = snapshot.data;
                    if (submissions != null) {
                      if (submissions.isEmpty) {
                        return const Text(
                          "There are no submitted materials available at the moment.",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        );
                      }
                      return ListView.builder( // Once posts are retrieved, generates ListView
                        itemCount: submissions.length,
                        itemBuilder: (BuildContext context, int index) {
                          LessonEntry entry = LessonEntry.fromMap(submissions[index].data());

                          //can we perform an actual filter?
                          if (filterQuery.text.isNotEmpty && !entry.matchesQuery(filterQuery.text)) {
                            return const SizedBox.shrink();
                          }
                          else {
                            currentDelay+=delayMilliSeconds;
                            return FadeInLeft(
                                delay: Duration(milliseconds: currentDelay),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                                  child: LessonApprovalWidget(entry: entry, docRef: submissions[index].reference),
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
      ),
    );
  }
}
