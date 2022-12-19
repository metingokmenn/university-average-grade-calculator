import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class GradeDropdownWidget extends StatefulWidget {
  final Function onGradeSelected;

  const GradeDropdownWidget({required this.onGradeSelected, super.key});

  @override
  State<GradeDropdownWidget> createState() => _GradeDropdownWidgetState();
}

class _GradeDropdownWidgetState extends State<GradeDropdownWidget> {
  double selectedLetter = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
          borderRadius: AppConstants.appBorderRadius,
          color: AppConstants.appPrimaryColor.shade200),
      child: DropdownButton<double>(
        value: selectedLetter,
        onChanged: (value) {
          setState(() {
            selectedLetter = value!;
            widget.onGradeSelected(selectedLetter);
          });
        },
        items: DataHelper.allClassesWithLettersAndValues(),
      ),
    );
  }
}
