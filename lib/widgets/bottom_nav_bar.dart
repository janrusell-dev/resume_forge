import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final Widget child;
  const BottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int currentIndex = 0;

     if (location.startsWith('/template')) {
      currentIndex = 1;
    } else if (location.startsWith('/settings')) {
      currentIndex = 2;
    }
    else{
      currentIndex = 0;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/template');
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
       items:  [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 1 ? Icons.dashboard_rounded : Icons.dashboard_outlined),
            label: 'Templates',
          ),
           BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 3 ? Icons.settings : Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        ),
    );
  }
}