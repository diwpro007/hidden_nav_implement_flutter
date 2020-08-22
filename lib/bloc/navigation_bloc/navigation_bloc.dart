import 'package:GOP_MOBILE_APP/widgets/event_container_screens/contacts_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/home_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/live_events_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/upcoming_events_container_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationEvents {
  HomeClickedEvent,
  LiveEventsClickedEvent,
  UpcomingLiveEventsClickedEvent,
  ContactsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final Function onMenuTap;

  NavigationBloc(NavigationStates initialState, this.onMenuTap)
      : super(initialState);

  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield HomeContainerScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.LiveEventsClickedEvent:
        yield LiveEventsContainerScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.UpcomingLiveEventsClickedEvent:
        yield UpcomingEventsContainerScreen(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.ContactsClickedEvent:
        yield ContactsContainerScreen(
          onMenuTap: onMenuTap,
        );
        break;
      default:
        break;
    }
  }
}
