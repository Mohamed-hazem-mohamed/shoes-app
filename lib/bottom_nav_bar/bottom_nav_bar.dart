import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../home/home.dart';
import '../profile.dart';
import '../setting.dart';
import 'cubit/cubit.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final List<Widget> screens = [
    Home(),
    Settings(),
    Profile(),
    Settings(),
    Profile(),
  ];

  final List<IconData> iconList = [
    Icons.house,
    Icons.heart_broken,
    Icons.notifications_active,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavCubit(),
      child: BlocBuilder<NavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: screens[currentIndex],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: const Icon(Icons.shopping_bag),
              onPressed: () {
                context.read<NavCubit>().changeTab(2);
              },
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: iconList,
              activeIndex: currentIndex > 1 ? currentIndex - 1 : currentIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              onTap: (index) {
                final correctedIndex = index >= 2 ? index + 1 : index;
                context.read<NavCubit>().changeTab(correctedIndex);
              },
            ),
          );
        },
      ),
    );
  }
}
