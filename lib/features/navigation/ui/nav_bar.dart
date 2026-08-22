import 'package:flutter/material.dart';
import 'package:sort_media/features/navigation/uistate/current_screen_model.dart';
import 'package:watch_it/watch_it.dart';

class NavBar extends WatchingWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentScreenNr = watchValue(
      (CurrentScreenModel m) => m.currentScreenNr,
    );
    return NavigationBar(
      onDestinationSelected: (value) async {
        if(value== currentScreenNr) {  // do nothing
          return;
        } 
        setCurrentScreenNr(value);

        await Navigator.pushNamed(
          context,
          navDests[value].path,
        );
        // after popping the new screen return to old (current) screen nr
        setCurrentScreenNr(currentScreenNr);
      },
      selectedIndex: currentScreenNr,
      destinations: navDests
          .map(
            (navDest) => NavigationDestination(
              icon: Icon(navDest.icon),
              label: navDest.label,
            ),
          )
          .toList(),
    );
  }
}
