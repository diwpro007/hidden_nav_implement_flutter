import 'package:GOP_MOBILE_APP/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global_conf.dart';

class DrawerMenu extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> menuScaleAnimation;
  final int selectedIndex;
  final Function onMenuItemClicked;

  const DrawerMenu({
    this.slideAnimation,
    this.menuScaleAnimation,
    this.selectedIndex,
    this.onMenuItemClicked,
  });

  @override
  Widget build(BuildContext context) {
    double topSafeAreaPadding = MediaQuery.of(context).padding.top;
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuScaleAnimation,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.only(
                top: topSafeAreaPadding + 12, left: 12.0, bottom: 12),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage:
                            AssetImage('assets/images/app_icon.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Global Online Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: drawerItems.map((element) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(element['navEvent']);
                          onMenuItemClicked();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Row(
                            children: [
                              Icon(element['icon'],
                                  color: Colors.white, size: 30),
                              SizedBox(width: 10),
                              Text(
                                element['title'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: selectedIndex == element['index']
                                      ? FontWeight.w900
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Icon(Icons.settings, color: Colors.white, size: 24),
                      const SizedBox(width: 10),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
