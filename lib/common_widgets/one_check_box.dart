import 'package:flutter/material.dart';

import '../constants.dart';

class OneCheckBox extends StatefulWidget {
  const OneCheckBox({
    required this.isChecked,
    required this.add,
    required this.remove,
    Key? key,
  }) : super(key: key);
  final bool isChecked;
  final Function() add;
  final Function() remove;

  @override
  OneCheckBoxState createState() => OneCheckBoxState();
}

class OneCheckBoxState extends State<OneCheckBox> {
  bool flag = false;

  @override
  void initState() {
    flag = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        activeColor: primaryColor,
        value: flag,
        onChanged: (value) {
          if (value != null) {
            if (value) {
              widget.add();
            } else {
              widget.remove();
            }
            setState(() {
              flag = value;
            });
          }
        },
      ),
    );
  }
}
