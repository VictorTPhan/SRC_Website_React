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
      LessonEntryLabel.societalFactor: entry.societalFactor,
      LessonEntryLabel.courseLevel: entry.courseLevel,
      LessonEntryLabel.csTopic: entry.csTopic,
      LessonEntryLabel.programmingLanguage: entry.programmingLanguage,
      LessonEntryLabel.prereqKnowledge: entry.prereqKnowledge,
      LessonEntryLabel.criticalComponents: entry.criticalComponents,
      LessonEntryLabel.learningObjectives: entry.learningObjectives,
      LessonEntryLabel.preReading: entry.preReading,
      LessonEntryLabel.timelimeOfActivities: entry.timelimeOfActivities,
      LessonEntryLabel.reflectionActivities: entry.reflectionActivities,
      LessonEntryLabel.effectiveTeachingMethods: entry.effectiveTeachingMethods,
      LessonEntryLabel.suggestedReadingMaterials: entry.suggestedReadingMaterials,
      LessonEntryLabel.issuesAndSolutions: entry.issuesAndSolutions,
      LessonEntryLabel.referencesForInstructor: entry.referencesForInstructor
    };

    List<DataRow> rows = [];
    for(String label in info.keys) {
      rows.add(DataRow(cells: [
        DataCell(Text(label)),
        DataCell(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(info[label]),
        ))
      ]));
    }

    return DataTable(
        dataRowMaxHeight: double.infinity,
        columns: [
          DataColumn(label: Text("Field", style: TextStyle(fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Response", style: TextStyle(fontWeight: FontWeight.bold)))
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
            style: Theme.of(context).textTheme.headlineSmall,
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