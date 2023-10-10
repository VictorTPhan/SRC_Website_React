import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:intl/intl.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:src_viewer/LessonEntry.dart';

import 'LessonEntryLabel.dart';

class LessonEntryDetailWidget extends StatelessWidget {
  LessonEntry entry;

  LessonEntryDetailWidget({super.key, required this.entry});

  Widget displayTabularFields(BuildContext context) {
    DateFormat dateFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
    DateTime timestamp = dateFormat.parse(entry.timeStamp);

    Map<String, dynamic> info = {
      LessonEntryLabel.timeStamp: [LessonEntryLabel.timeStampToolTip, "${timestamp.month}/${timestamp.day}/${timestamp.year}"],
      LessonEntryLabel.type: [LessonEntryLabel.typeToolTip, entry.type],
      LessonEntryLabel.series: [LessonEntryLabel.seriesToolTip, entry.series],
      LessonEntryLabel.courseLevel: [LessonEntryLabel.courseLevelToolTip, entry.courseLevel],
      LessonEntryLabel.csTopic: [LessonEntryLabel.csTopicToolTip, entry.csTopic],
      LessonEntryLabel.programmingLanguage: [LessonEntryLabel.programmingLanguageToolTip, entry.programmingLanguage],
      LessonEntryLabel.societalFactor: [LessonEntryLabel.societalFactorToolTip, entry.societalFactor],
      LessonEntryLabel.learningObjectives: [LessonEntryLabel.learningObjectivesToolTip, entry.learningObjectives],
      LessonEntryLabel.preReading: [LessonEntryLabel.prereqKnowledgeToolTip, entry.preReading],
      LessonEntryLabel.suggestedReadingMaterials: [LessonEntryLabel.suggestedReadingMaterialsToolTip, entry.suggestedReadingMaterials],
      LessonEntryLabel.prereqKnowledge: [LessonEntryLabel.prereqKnowledgeToolTip, entry.prereqKnowledge],
      LessonEntryLabel.criticalComponents: [LessonEntryLabel.criticalComponentsToolTip, entry.criticalComponents],
      LessonEntryLabel.timelimeOfActivities: [LessonEntryLabel.timelimeOfActivitiesToolTip, entry.timelimeOfActivities],
      LessonEntryLabel.reflectionActivities: [LessonEntryLabel.reflectionActivitiesToolTip, entry.reflectionActivities],
      LessonEntryLabel.effectiveTeachingMethods: [LessonEntryLabel.effectiveTeachingMethodsToolTip, entry.effectiveTeachingMethods],
      LessonEntryLabel.issuesAndSolutions: [LessonEntryLabel.issuesAndSolutionsToolTip, entry.issuesAndSolutions],
      LessonEntryLabel.referencesForInstructor: [LessonEntryLabel.referencesForInstructorToolTip, entry.referencesForInstructor]
    };

    List<DataRow> rows = [];
    int delayMilliSeconds = 75;
    int currentDelay = 0;
    for(String label in info.keys) {
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
                          info[label][0],
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
                  child: Text(info[label][1]),
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
          Text("       " + entry.description),
          displayTabularFields(context),
        ],
      ),
    );
  }
}