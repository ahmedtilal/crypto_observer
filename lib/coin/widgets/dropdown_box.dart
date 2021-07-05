import 'package:crypto_observer/coin/coins.dart';
import 'package:flutter/material.dart';

class DropDownBox extends StatelessWidget {
  const DropDownBox({
    @required this.dropDownValue,
    @required this.onChanged,
    @required this.hintText,
  });
  final ValueChanged<String?>? onChanged;
  final PercentagePeriod? dropDownValue;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return FormField(builder: (context) {
      return InputField(
        child: InputDecorator(
          decoration: InputDecoration(border: InputBorder.none),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(hintText!),
              isDense: true,
              value: dropDownValue.toString().split('_').last,
              elevation: 10,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              onChanged: onChanged,
              items: getDropdownMenuItems(periodsList),
            ),
          ),
        ),
      );
    });
  }

  static const List<String> periodsList = [
    '1h',
    '24h',
    '7d',
    '30d',
    '60d',
    '90d'
  ];

  List<DropdownMenuItem<String>> getDropdownMenuItems(List list) {
    List<DropdownMenuItem<String>> itemsList = [];
    for (var i = 0; i < list.length; i++) {
      itemsList.add(
        DropdownMenuItem(
          value: list[i],
          child: Text(list[i]),
        ),
      );
    }
    return itemsList;
  }
}

class InputField extends StatelessWidget {
  final Widget? child;
  InputField({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      height: 60.0,
      child: child,
    );
  }
}
