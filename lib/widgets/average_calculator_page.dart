import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/app_constants.dart';
import 'package:grade_calculator/helper/data_helper.dart';
import 'package:grade_calculator/model/course.dart';
import 'package:grade_calculator/widgets/course_list.dart';
import 'package:grade_calculator/widgets/credits_dropdown_widget.dart';
import 'package:grade_calculator/widgets/grade_letter_dropdown_widget.dart';
import 'package:grade_calculator/widgets/show_average.dart';
import 'package:grade_calculator/widgets/text_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int selectedCredit = 1;
  String typedCourseName = '';
  double selectedLetter = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppConstants.titleText,
          style: AppConstants.titleStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: _courseForm(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: ShowAverage(
                    average: DataHelper.computeAverage(),
                    courseCount: DataHelper.allAddedCourses.length,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: CourseList(
              onDismiss: (index) {
                DataHelper.allAddedCourses.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseForm() {
    return Padding(
      padding: AppConstants.allPadding,
      child: Form(
        key: formKey,
        child: Column(children: [
          CustomTextFormField(onTypingEnd: (value) {
            typedCourseName = value;
          }),
          Padding(
            padding: AppConstants.verticalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GradeDropdownWidget(
                  onGradeSelected: (letter) {
                    selectedLetter = letter;
                  },
                ),
                CreditDropdownWidget(onCreditSelected: (credit) {
                  selectedCredit = credit;
                }),
                IconButton(
                  onPressed: addCourseComputeAverage,
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                  color: AppConstants.appPrimaryColor,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
  void addCourseComputeAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Course addedCourse = Course(
          courseName: typedCourseName,
          credit: selectedCredit,
          grade: selectedLetter);

      DataHelper.addCourse(addedCourse);
      print(DataHelper.computeAverage());
      setState(() {});
    }
  }
}
