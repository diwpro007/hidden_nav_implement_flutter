import 'package:GOP_MOBILE_APP/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_header.dart';
import 'package:flutter/material.dart';

class ContactsContainerScreen extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const ContactsContainerScreen({this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EventContainerHeader(
            onMenuTap: onMenuTap,
            title: "Contacts",
          )
        ],
      ),
    );
  }
}
