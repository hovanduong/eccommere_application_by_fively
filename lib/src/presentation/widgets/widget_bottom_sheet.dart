import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showModalBottomCustom(
    {required BuildContext context,
    required Widget widget,
    double height = 200}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        // height: height,
        child: widget,
      ),
    ),
  );
}
