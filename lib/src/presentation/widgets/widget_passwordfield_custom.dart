import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetInputPasswordCustom extends StatefulWidget {
  final TextEditingController controller;
  final String textError;
  final Function(String value) onChange;
  final String? label;

  const WidgetInputPasswordCustom({
    Key? key,
    required this.controller,
    required this.textError,
    required this.onChange,
    this.label,
  }) : super(key: key);

  @override
  _WidgetInputPasswordCustomState createState() =>
      _WidgetInputPasswordCustomState();
}

class _WidgetInputPasswordCustomState extends State<WidgetInputPasswordCustom> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
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
                    color: Theme.of(context).shadowColor.withAlpha(30),
                  )
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
                            obscureText: obscureText,
                            controller: widget.controller,
                            maxLines: 1,
                            style: STYLE_SMALL_BOLD,
                            onChanged: widget.onChange,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              setState(() => obscureText = !obscureText),
                          child: Container(
                            child: Icon(
                              obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 5),
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
