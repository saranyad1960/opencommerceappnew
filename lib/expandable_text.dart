import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle; // New parameter for TextStyle

  ExpandableTextWidget({
    required this.text,
    this.maxLines = 3,
    this.textStyle, // Initialize textStyle parameter
  });

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: widget.textStyle, // Apply the provided textStyle
          ),
          secondChild: Text(
            widget.text,
            softWrap: true,
            style: widget.textStyle, // Apply the provided textStyle
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _isExpanded ? Text('less',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 10)):
              Text('more...',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blueAccent,fontSize: 10),),
            ],
          ),
        ),
      ],
    );
  }
}
