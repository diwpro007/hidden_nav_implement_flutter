import 'package:GOP_MOBILE_APP/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFFF2A541);

List<Map> drawerItems = [
  {
    'index': 0,
    'icon': Icons.home,
    'title': 'Home',
    'navEvent': NavigationEvents.HomeClickedEvent
  },
  {
    'index': 1,
    'icon': Icons.live_tv,
    'title': 'Live Events',
    'navEvent': NavigationEvents.LiveEventsClickedEvent
  },
  {
    'index': 2,
    'icon': Icons.next_week,
    'title': 'Upcoming Events',
    'navEvent': NavigationEvents.UpcomingLiveEventsClickedEvent
  },
  {
    'index': 3,
    'icon': Icons.contacts,
    'title': 'Contacts',
    'navEvent': NavigationEvents.ContactsClickedEvent
  },
];
