import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:src_viewer/LessonEntry.dart';

import 'LessonEntryLabel.dart';

class LessonEntryDetailWidget extends StatelessWidget {
  LessonEntry entry;

  LessonEntryDetailWidget({super.key, required this.entry});

  Widget displayTabularFields(BuildContext context) {
    Map<String, dynamic> info = {
      LessonEntryLabel.timeStamp: entry.timeStamp,
      LessonEntryLabel.type: entry.type,
      LessonEntryLabel.series: entry.series,
      LessonEntryLabel.courseLevel: entry.courseLevel,
      LessonEntryLabel.csTopic: entry.csTopic,
      LessonEntryLabel.programmingLanguage: entry.programmingLanguage,
      LessonEntryLabel.societalFactor: entry.societalFactor,
      LessonEntryLabel.learningObjectives: entry.learningObjectives,
      LessonEntryLabel.preReading: entry.preReading,
      LessonEntryLabel.suggestedReadingMaterials: entry.suggestedReadingMaterials,
      LessonEntryLabel.prereqKnowledge: entry.prereqKnowledge,
      LessonEntryLabel.criticalComponents: entry.criticalComponents,
      LessonEntryLabel.timelimeOfActivities: entry.timelimeOfActivities,
      LessonEntryLabel.reflectionActivities: entry.reflectionActivities,
      LessonEntryLabel.effectiveTeachingMethods: entry.effectiveTeachingMethods,
      LessonEntryLabel.issuesAndSolutions: entry.issuesAndSolutions,
      LessonEntryLabel.referencesForInstructor: entry.referencesForInstructor
    };

    List<DataRow> rows = [];
    int delayMilliSeconds = 75;
    int currentDelay = 0;
    for(String label in info.keys) {
      rows.add(DataRow(cells: [
        DataCell(
            FadeInLeft(
                delay: Duration(milliseconds: currentDelay),
                child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))
            )
        ),
        DataCell(
            FadeInLeft(
                delay: Duration(milliseconds: currentDelay),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(info[label]),
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            entry.activity,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25
            ),
          ),
          Text(
            "by ${entry.contributorName}\t(${entry.contributorEmail})",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            entry.description,
          ),
          displayTabularFields(context),
        ],
      ),
    );
  }
}