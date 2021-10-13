import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetCustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String textError;
  final Function(String value) onChange;
  final String? label;

  const WidgetCustomInputField({
    Key? key,
    required this.controller,
    required this.textError,
    required this.onChange,
    this.label,
  }) : super(key: key);

  @override
  _WidgetCustomInputFieldState createState() => _WidgetCustomInputFieldState();
}

class _WidgetCustomInputFieldState extends State<WidgetCustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 70,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: AppValues.DEFAULT_PADDING,
              vertical: AppValues.DEFAULT_PADDING - 6,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                      color: Theme.of(context).shadowColor.withAlpha(80))
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.label!, style: STYLE_SMALL_BOLD),
                  SizedBox(
                    height: 25,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: widget.controller,
                            maxLines: 1,
                            style: STYLE_SMALL_BOLD,
                            onChanged: widget.onChange,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        widget.textError == "" &&
                                widget.controller.text.length > 0
                            ? Container(
                                child: Icon(
                                  Icons.check_outlined,
                                  color: SUCCESS_COLOR,
                                ),
                              )
                            : Container(
                                child: Icon(
                                  Icons.error_outline,
                                  color: ERROR_COLOR,
                                ),
                              )
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              widget.textError,
              style: STYLE_SMALL_BOLD.copyWith(
                  color: Theme.of(context).errorColor),
            ),
          )
        ],
      ),
    );
  }
}
