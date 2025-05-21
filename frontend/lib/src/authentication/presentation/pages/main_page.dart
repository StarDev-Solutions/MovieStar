import 'package:flutter/material.dart';
import 'package:frontend/src/authentication/domain/entities/nav_item_model.dart';
import 'package:frontend/src/authentication/domain/entities/rive_model.dart';
import 'package:frontend/src/authentication/presentation/pages/home_page.dart';
import 'package:frontend/src/authentication/presentation/pages/widgets/animated_bar.dart';
import 'package:frontend/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:rive/rive.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _selectedNavIndex = 0;
  final List<SMIBool> _riveIconInputs = [];

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1400));
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomePage(),
        ],
      ),
      bottomNavigationBar: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          height: 66,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 20,),
          decoration: BoxDecoration(
            color: bottomNavBackgroundColor.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              // BoxShadow(
              //   color: bottomNavBackgroundColor..withValues(alpha: 0.20),
              //   offset: Offset(0, 20),
              //   blurRadius: 20,
              // )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomNavItems.length, (index) {
              final RiveModel riveIcon = bottomNavItems[index].rive;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: _selectedNavIndex == index),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      _animateIcon(index);
                      setState(() => _selectedNavIndex = index);
                      _pageController.jumpToPage(index);
                    },
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: _selectedNavIndex == index ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard) => _riveOnIt(artboard, stateMachineName: riveIcon.stateMachineName),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _riveOnIt(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );
    if (controller != null) {
      artboard.addController(controller);
      _riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
    }
  }
  
  void _animateIcon(int index) {
    _riveIconInputs[index].change(true);
    Future.delayed(Duration(seconds: 1), () => _riveIconInputs[index].change(false));
  }
}
