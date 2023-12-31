import 'dart:ui';

import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:wedding_pitch/screen/gallery_screen.dart';
import 'package:wedding_pitch/screen/home_screen.dart';
import 'package:wedding_pitch/screen/info_screen.dart';
import 'package:wedding_pitch/style/color.dart';
import 'package:wedding_pitch/utils/get_random_image.dart';
import 'package:wedding_pitch/widget/nav_tab.dart';

final coverIndex = getRandomNumber();

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({
    super.key,
  });

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool isInNavigation = false;
  bool isActive = false;

  void onTapStart() {
    setState(() {
      isInNavigation = true;
      _animationController.forward();
    });
  }

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 1) {
        setState(() {
          isActive = true;
        });
      } else {
        setState(() {
          isActive = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(
            coverImage: getCoverImage(coverIndex),
            coverIndex: coverIndex,
            isInNavigation: ValueNotifier(isInNavigation),
            onTapStart: onTapStart,
            animationController: _animationController,
          ),
          GalleryScreen(
            isActive: isActive,
          ),
          const InfoScreen(),
        ],
      ),
      bottomNavigationBar: SlideTransition(
        position: _offsetAnimation,
        child: BottomAppBar(
          color: Colors.white.withOpacity(0.8),
          elevation: 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NavTab(
                    isSelected: _selectedIndex == 0,
                    icon: Boxicons.bx_cool,
                    selectedIcon: Boxicons.bx_cool,
                    onTap: () => _onTap(0),
                    tabColor: WeddingColor.mainTabColor,
                  ),
                  NavTab(
                    isSelected: _selectedIndex == 1,
                    icon: Boxicons.bx_gift,
                    selectedIcon: Boxicons.bx_gift,
                    onTap: () => _onTap(1),
                    tabColor: WeddingColor.galleryTabColor,
                  ),
                  NavTab(
                    isSelected: _selectedIndex == 2,
                    icon: Boxicons.bx_map,
                    selectedIcon: Boxicons.bx_map,
                    onTap: () => _onTap(2),
                    tabColor: WeddingColor.infoTabColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
