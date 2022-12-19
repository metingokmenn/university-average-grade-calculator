import 'package:grade_calculator/helper/data_helper.dart';

class Course {
  final String courseName;
  final int credit;
  final double grade;

  Course({required this.courseName, required this.credit, required this.grade});

  @override
  String toString() {
    return "Course name: $courseName, Credit: $credit, Grade: ${DataHelper.valueToLetter(grade)}";
  }
}
