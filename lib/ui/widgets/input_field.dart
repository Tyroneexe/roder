// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roder/ui/theme.dart';
import 'package:get/get.dart';

import '../../provider/clrProvider.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  MyInputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  });

  Color _mainColor = blueClr;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                    color: _getMainClr(
                        Provider.of<ColorProvider>(context).selectedColor),
                    width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Expanded(
                  child: TextFormField(
                readOnly: widget == null ? false : true,
                autofocus: false,
                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                controller: controller,
                style: subTitleStyle,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: subTitleStyle,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: context.theme.colorScheme.background, width: 0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: context.theme.colorScheme.background, width: 0),
                  ),
                ),
              )),
              widget == null ? Container() : Container(child: widget)
            ]),
          )
        ],
      ),
    );
  }

  _getMainClr(int no) {
    switch (no) {
      case 0:
        _mainColor = blueClr;
        return blueClr;
      case 1:
        _mainColor = oRange;
        return oRange;
      case 2:
        _mainColor = themeRed;
        return themeRed;
      default:
        _mainColor = blueClr;
        return blueClr;
    }
  }
}