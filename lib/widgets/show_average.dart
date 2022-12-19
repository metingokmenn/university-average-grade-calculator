import 'package:flutter/material.dart';
import 'package:grade_calculator/constants/app_constants.dart';

class ShowAverage extends StatefulWidget {
  final double average;
  final int courseCount;
  const ShowAverage(
      {required this.average, required this.courseCount, super.key});

  @override
  State<ShowAverage> createState() => _ShowAverageState();
}

class _ShowAverageState extends State<ShowAverage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.courseCount > 0
              ? '${widget.courseCount} course selected'
              : 'Enter a course',
          style: AppConstants.averageBodyStyle,
        ),
        Text(
          widget.average > 0 ? widget.average.toStringAsFixed(2) : '0.0',
          style: AppConstants.averageStyle,
        ),
        Text(
          'Ortalama',
          style: AppConstants.averageBodyStyle,
        ),
      ],
    );
  }
}
