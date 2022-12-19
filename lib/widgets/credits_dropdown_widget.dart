import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdownWidget({required this.onCreditSelected, super.key});

  @override
  State<CreditDropdownWidget> createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  int selectedCredit = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.dropDownPadding,
      decoration: BoxDecoration(
          borderRadius: AppConstants.appBorderRadius,
          color: AppConstants.appPrimaryColor.shade200),
      child: DropdownButton<int>(
        value: selectedCredit,
        onChanged: (value) {
          setState(() {
            selectedCredit = value!;
            print(selectedCredit);
            widget.onCreditSelected(selectedCredit);
          });
        },
        items: DataHelper.allCreditsAndValues(),
      ),
    );
  }
}
