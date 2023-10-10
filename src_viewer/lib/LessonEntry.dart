import 'package:src_viewer/LessonEntryLabel.dart';

class LessonEntry {
  String timeStamp;
  String activity;
  String contributorEmail;
  String contributorName;
  String description;
  String type;
  String series;
  String societalFactor;
  String courseLevel;
  String csTopic;
  String programmingLanguage;
  String prereqKnowledge;
  String criticalComponents;
  String learningObjectives;
  String preReading;
  String timelimeOfActivities;
  String reflectionActivities;
  String effectiveTeachingMethods;
  String suggestedReadingMaterials;
  String issuesAndSolutions;
  String referencesForInstructor;
  String fileSubmission;

  LessonEntry({
    required this.timeStamp,
    required this.activity,
    required this.contributorEmail,
    required this.contributorName,
    required this.description,
    required this.type,
    required this.series,
    required this.societalFactor,
    required this.courseLevel,
    required this.csTopic,
    required this.programmingLanguage,
    required this.prereqKnowledge,
    required this.criticalComponents,
    required this.learningObjectives,
    required this.preReading,
    required this.timelimeOfActivities,
    required this.reflectionActivities,
    required this.effectiveTeachingMethods,
    required this.suggestedReadingMaterials,
    required this.issuesAndSolutions,
    required this.referencesForInstructor,
    required this.fileSubmission
  });

  bool matchesQuery(String query) {
    String combined = timeStamp + activity + contributorEmail + contributorName + description
        + type + series + societalFactor + courseLevel + csTopic + programmingLanguage
        + prereqKnowledge + criticalComponents + learningObjectives + preReading + timelimeOfActivities
        + effectiveTeachingMethods + suggestedReadingMaterials + issuesAndSolutions + referencesForInstructor + fileSubmission;
    return combined.toLowerCase().contains(query.toLowerCase());
  }

  factory LessonEntry.fromMap(Map<String, dynamic> map) {
    return LessonEntry(
        timeStamp: map['timeStamp'],
        activity: map['activity'],
        contributorEmail: map['contributorEmail'],
        contributorName: map['contributorName'],
        description: map['description'],
        type: map['type'],
        series: map['series'],
        societalFactor: map['societalFactor'],
        courseLevel: map['courseLevel'],
        csTopic: map['csTopic'],
        programmingLanguage: map['programmingLanguage'],
        prereqKnowledge: map['prereqKnowledge'],
        criticalComponents: map['criticalComponents'],
        learningObjectives: map['learningObjectives'],
        preReading: map['preReading'],
        timelimeOfActivities: map['timelimeOfActivities'],
        reflectionActivities: map['reflectionActivities'],
        effectiveTeachingMethods: map['effectiveTeachingMethods'],
        suggestedReadingMaterials: map['suggestedReadingMaterials'],
        issuesAndSolutions: map['issuesAndSolutions'],
        referencesForInstructor: map['referencesForInstructor'],
        fileSubmission: map['fileSubmission']
    );
  }
}