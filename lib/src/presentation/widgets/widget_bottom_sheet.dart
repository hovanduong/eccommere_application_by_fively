import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showModalBottomCustom(BuildContext context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          child: Column(  
            children: [
              Text("First Name Change"),
            ],
          ),
        );
      });
}
