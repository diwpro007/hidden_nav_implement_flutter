import 'package:GOP_MOBILE_APP/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:GOP_MOBILE_APP/widgets/drawer_menu.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/contacts_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/home_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/live_events_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/event_container_screens/upcoming_events_container_screen.dart';
import 'package:GOP_MOBILE_APP/widgets/main_screen_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 250);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  void onMenuTap() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();
      isCollapsed = !isCollapsed;
    });
  }

  void onMenuItemClicked() {
    setState(() {
      _controller.reverse();
    });
    isCollapsed = !isCollapsed;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(
            HomeContainerScreen(
              onMenuTap: onMenuTap,
            ),
            onMenuTap),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, NavigationStates navigationState) {
              return DrawerMenu(
                slideAnimation: _slideAnimation,
                menuScaleAnimation: _menuScaleAnimation,
                selectedIndex: findSelectedIndex(navigationState),
                onMenuItemClicked: onMenuItemClicked,
              );
            }),
            MainScreenContainer(
              duration: duration,
              onMenuTap: onMenuTap,
              scaleAnimation: _scaleAnimation,
              isCollapsed: isCollapsed,
              screenWidth: screenWidth,
              // This part will be changed based on the click on Menu Items
              child: BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, NavigationStates navigationState) {
                  return navigationState as Widget;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int findSelectedIndex(NavigationStates navigationStates) {
  if (navigationStates is HomeContainerScreen) {
    return 0;
  } else if (navigationStates is LiveEventsContainerScreen) {
    return 1;
  } else if (navigationStates is UpcomingEventsContainerScreen) {
    return 2;
  } else if (navigationStates is ContactsContainerScreen) {
    return 3;
  } else {
    return 0;
  }
}
