import 'package:frontend/src/authentication/domain/entities/rive_model.dart';

class NavItem {
  final String title;
  final RiveModel rive;

  NavItem({required this.title, required this.rive});
}

List<NavItem> bottomNavItems = [
  NavItem(
    title: 'Home',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'HOME',
      stateMachineName: 'HOME_Interactivity',
    ),
  ),
  NavItem(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
    ),
  ),
  NavItem(
    title: 'Timer',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  NavItem(
    title: 'Profile',
    rive: RiveModel(
      src: 'assets/rive/nav_icons.riv',
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
    ),
  ),
];