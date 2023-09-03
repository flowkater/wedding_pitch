import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:wedding_pitch/screen/gallery_screen.dart';
import 'package:wedding_pitch/screen/home_screen.dart';
import 'package:wedding_pitch/widget/nav_tab.dart';

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

  bool _isGalleryActive = false;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _isGalleryActive = index == 1;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward(); // 애니메이션 시작

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // 시작 위치 (바로 아래)
      end: const Offset(0, 0), // 끝 위치 (원래 위치)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose(); // Controller 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          const HomeScreen(
            isInNavigation: true,
          ),
          GalleryScreen(
            isActive: _isGalleryActive,
          ),
          Center(
            child: Text("$_selectedIndex Information"),
          ),
        ],
      ),
      bottomNavigationBar: SlideTransition(
        position: _offsetAnimation,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                text: "메인",
                isSelected: _selectedIndex == 0,
                icon: Remix.cake_2_line,
                selectedIcon: Remix.cake_2_fill,
                onTap: () => _onTap(0),
              ),
              NavTab(
                text: "앨범",
                isSelected: _selectedIndex == 1,
                icon: Remix.star_s_line,
                selectedIcon: Remix.star_s_fill,
                onTap: () => _onTap(1),
              ),
              NavTab(
                text: "정보",
                isSelected: _selectedIndex == 2,
                icon: Remix.map_pin_2_line,
                selectedIcon: Remix.map_pin_2_fill,
                onTap: () => _onTap(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
