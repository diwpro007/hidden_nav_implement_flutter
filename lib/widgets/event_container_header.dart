import 'package:flutter/material.dart';

class EventContainerHeader extends StatelessWidget {
  final Function onMenuTap;
  final String title;

  const EventContainerHeader({this.onMenuTap, this.title});
  @override
  Widget build(BuildContext context) {
    double topSafeAreaPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 16, top: topSafeAreaPadding + 8),
      child: Row(
        children: [
          InkWell(
            child: Icon(
              Icons.menu,
              size: 36,
            ),
            onTap: onMenuTap,
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}
