import 'package:flutter/material.dart';

import '../model/course.dart';

class DataHelper {
  static List<String> allLetterGrades() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  static List<Course> allAddedCourses = [];

  static addCourse(Course course) {
    allAddedCourses.add(course);
  }

  static List<int> allCreditValues() {
    return List.generate(10, (index) => (index + 1));
  }

  static double letterToValue(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;

      default:
        return 1;
    }
  }

  static String valueToLetter(double value) {
    if (value == 4) {
      return "AA";
    } else if (value == 3.5) {
      return "BA";
    } else if (value == 3) {
      return "BB";
    } else if (value == 2.5) {
      return "CB";
    } else if (value == 2.0) {
      return "CC";
    } else if (value == 1.5) {
      return "DC";
    } else if (value == 1.0) {
      return "DD";
    } else if (value == 0.5) {
      return "FD";
    } else if (value == 0.0) {
      return "FF";
    } else {
      return "Invalid";
    }
  }

  static List<DropdownMenuItem<double>> allClassesWithLettersAndValues() {
    return allLetterGrades()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: letterToValue(e),
            ))
        .toList();
  }

  static List<DropdownMenuItem<int>> allCreditsAndValues() {
    return allCreditValues()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }

  static double computeAverage() {
    double totalGrade = 0;
    double totalCredit = 0;

    allAddedCourses.forEach((element) {
      totalGrade = totalGrade + (element.credit * element.grade);
      totalCredit += element.credit;
    });

    return totalGrade / totalCredit;
  }
}
