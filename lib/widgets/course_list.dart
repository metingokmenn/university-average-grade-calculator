import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/app_constants.dart';
import 'package:grade_calculator/helper/data_helper.dart';

import '../model/course.dart';

class CourseList extends StatelessWidget {
  final Function onDismiss;

  const CourseList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Course> allCourses = DataHelper.allAddedCourses;
    return allCourses.length > 0
        ? ListView.builder(
            itemCount: DataHelper.allAddedCourses.length,
            itemBuilder: ((context, index) {
              Course currentCourse = DataHelper.allAddedCourses[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: ListTile(
                  leading: CircleAvatar(
                      child:
                          Text(DataHelper.valueToLetter(currentCourse.grade))),
                  title: Text(currentCourse.courseName),
                  subtitle: Text("${currentCourse.credit} credits"),
                ),
              );
            }))
        : Center(
            child: Text(
              'Add a course',
              style: AppConstants.averageStyle,
            ),
          );
  }
}
