import 'package:flutter/material.dart';

import '../constants.dart';

class OneCheckBox extends StatefulWidget {
  final bool isChecked;
  final Function() add;
  final Function() remove;

  const OneCheckBox(
      {required this.isChecked,
      required this.add,
      required this.remove,
      Key? key})
      : super(key: key);

  @override
  _OneCheckBoxState createState() => _OneCheckBoxState();
}

class _OneCheckBoxState extends State<OneCheckBox> {

  bool _flag = false;

  @override
  void initState() {
    _flag = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        activeColor: primaryColor,
        value: _flag,
        onChanged: (value) {
          if (value != null) {
            if (value) {
              widget.add();
            } else {
              widget.remove();
            }
            setState(() {
              _flag = value;
            });
          }
        },
      ),
    );
  }
}
