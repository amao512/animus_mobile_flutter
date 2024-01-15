
import 'package:animus_mobile_flutter/app/theme/colors.dart';
import 'package:animus_mobile_flutter/presentation/navigation/model/tab_type.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GlobalKey bottomNavGlobalKey = GlobalKey(debugLabel: 'btm_app_bar');

class NavigationScreen extends StatefulWidget {

  final StatefulNavigationShell child;

  const NavigationScreen({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _NavigationState();

}

class _NavigationState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      key: bottomNavGlobalKey,
      backgroundColor: AppColors.background,
      iconSize: 24,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 11,
      unselectedFontSize: 11,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.child.currentIndex,
      onTap: (index) {
        widget.child.goBranch(
          index,
          initialLocation: index == widget.child.currentIndex,
        );

        setState(() {});
      },
      items: _bottomNavItems(),
    );
  }

  _bottomNavItems() {
    return [
      createBottomNavItem(
        "Home",
        Icons.home,
        widget.child.currentIndex == TabType.home.position,
      ),
      createBottomNavItem(
        "Search",
        Icons.search,
        widget.child.currentIndex == TabType.search.position,
      ),
      createBottomNavItem(
        "Profile",
        Icons.person,
        widget.child.currentIndex == TabType.profile.position,
      ),
    ];
  }

  BottomNavigationBarItem createBottomNavItem(
      String title,
      IconData icon,
      bool isSelected,
      ) =>
      BottomNavigationBarItem(
        icon: Icon(icon),
        label: title,
      );
}