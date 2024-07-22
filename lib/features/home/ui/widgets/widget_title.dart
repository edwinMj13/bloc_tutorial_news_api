import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../news_list/ui/news_list.dart';

class WidgetTitle extends StatelessWidget {
  final String title;
  final String tag;

  WidgetTitle({
    super.key,
    required this.title,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => NewsListScreen(
                      tag: tag,
                    )));
          },
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          ),
        ),
      ],
    );
  }
}
