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

  bool matchesQuery(String field, String query) {
    String? fieldData = null;
    switch(field) {
      case LessonEntryLabel.timeStamp:
        fieldData = timeStamp;
        break;
      case LessonEntryLabel.activity:
        fieldData = activity;
        break;
      case LessonEntryLabel.contributorEmail:
        fieldData = contributorEmail;
        break;
      case LessonEntryLabel.contributorName:
        fieldData = contributorName;
        break;
      case LessonEntryLabel.description:
        fieldData = description;
        break;
      case LessonEntryLabel.type:
        fieldData = type;
        break;
      case LessonEntryLabel.series:
        fieldData = series;
        break;
      case LessonEntryLabel.societalFactor:
        fieldData = societalFactor;
        break;
      case LessonEntryLabel.courseLevel:
        fieldData = courseLevel;
        break;
      case LessonEntryLabel.csTopic:
        fieldData = csTopic;
        break;
      case LessonEntryLabel.programmingLanguage:
        fieldData = programmingLanguage;
        break;
      case LessonEntryLabel.prereqKnowledge:
        fieldData = prereqKnowledge;
        break;
      case LessonEntryLabel.criticalComponents:
        fieldData = criticalComponents;
        break;
      case LessonEntryLabel.learningObjectives:
        fieldData = learningObjectives;
        break;
      case LessonEntryLabel.preReading:
        fieldData = preReading;
        break;
      case LessonEntryLabel.timelimeOfActivities:
        fieldData = timelimeOfActivities;
        break;
      case LessonEntryLabel.reflectionActivities:
        fieldData = reflectionActivities;
        break;
      case LessonEntryLabel.effectiveTeachingMethods:
        fieldData = effectiveTeachingMethods;
        break;
      case LessonEntryLabel.suggestedReadingMaterials:
        fieldData = suggestedReadingMaterials;
        break;
      case LessonEntryLabel.issuesAndSolutions:
        fieldData = issuesAndSolutions;
        break;
      case LessonEntryLabel.referencesForInstructor:
        fieldData = referencesForInstructor;
        break;
      case LessonEntryLabel.fileSubmission:
        fieldData = fileSubmission;
        break;
    }

    print("FIELD DATA :" + fieldData.toString() + " " + query);

    if (fieldData == null) {
      return true;
    } else {
      return fieldData.toLowerCase().contains(query);
    }
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