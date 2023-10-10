import 'package:flutter/cupertino.dart';

class LessonEntryLabel {
  static const String timeStamp = "Upload Date";
  static const String activity = "Activity";
  static const String contributorEmail = "Contributor Email";
  static const String contributorName = "Contributor Name";
  static const String description = "Description";
  static const String type = "Type";
  static const String series = "Series";
  static const String societalFactor = "Societal Factor/Domain";
  static const String courseLevel = "Course Level";
  static const String csTopic = "CS Topic";
  static const String programmingLanguage = "Programming Language";
  static const String prereqKnowledge = "Prerequisite Knowledge";
  static const String criticalComponents = "Critical Components";
  static const String learningObjectives = "Learning Objectives";
  static const String preReading = "Pre-Reading";
  static const String timelimeOfActivities = "Timeline of Activities";
  static const String reflectionActivities = "Reflection Activities";
  static const String effectiveTeachingMethods = "Effective Teaching Methods";
  static const String suggestedReadingMaterials = "Suggested Reading Materials";
  static const String issuesAndSolutions = "Issues and Solutions";
  static const String referencesForInstructor = "References for Instructors";
  static const String fileSubmission = "File URL";

  static const String timeStampToolTip = "The time that this assignment was uploaded.";
  static const String activityToolTip = "The name of the lesson.";
  static const String contributorEmailToolTip = "The email address of the assignment creator.";
  static const String contributorNameToolTip = "The name of the assignment creator";
  static const String descriptionToolTip = "A short description of the concept covered and the tasks students will complete.";
  static const String typeToolTip = "Whether this is an assignment, a project, or part of an assignment series.";
  static const String seriesToolTip = "If the type of the assignment is part of an assignment series, the name will be here. Otherwise, this may be ignored.";
  static const String societalFactorToolTip = "The societal factor or domain related to this assignment.";
  static const String courseLevelToolTip = "The intended course for this assignment";
  static const String csTopicToolTip = "A list of topics as covered by this assignment.";
  static const String programmingLanguageToolTip = "Programming languages that submissions to this assignment allow.";
  static const String prereqKnowledgeToolTip = "A list of concepts students should already know so they can work on the assignment.";
  static const String criticalComponentsToolTip = "A list of requirements that should be satisfied to use the assignment. For example, access to the internet, student experience with using a particular programming environment, etc.";
  static const String learningObjectivesToolTip = "A list of clear and measurable learning objectives. ";
  static const String preReadingToolTip = "If applicable, a list of readings or describe discussions that will prepare students to work on the assignment.";
  static const String timelimeOfActivitiesToolTip = "A list of details on how much time students should spend on subtasks of the assignment.";
  static const String reflectionActivitiesToolTip = "A list of follow up activities that help students reflect on the theme or topic learned.";
  static const String effectiveTeachingMethodsToolTip = "Any teaching styles that can present the assignment effectively.";
  static const String suggestedReadingMaterialsToolTip = "A  list of materials that will facilitate the distribution of the assignment and help students complete the task.";
  static const String issuesAndSolutionsToolTip = "A list of issues that instructors might experience while giving the assignment and possible solutions to address them.";
  static const String referencesForInstructorToolTip = "Any reference materials, readings, or answer keys that can help the instructor.";
  static const String fileSubmissionToolTip = "A link to a Google Drive document of the assignment for you to download.";

  static List<String> allLabels = [
    timeStamp,
    activity,
    contributorEmail,
    contributorName,
    description,
    type,
    series,
    societalFactor,
    courseLevel,
    csTopic,
    programmingLanguage,
    prereqKnowledge,
    criticalComponents,
    learningObjectives,
    preReading,
    timelimeOfActivities,
    reflectionActivities,
    effectiveTeachingMethods,
    suggestedReadingMaterials,
    issuesAndSolutions,
    referencesForInstructor,
    fileSubmission
  ];
}