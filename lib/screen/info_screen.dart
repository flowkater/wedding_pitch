import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wedding_pitch/widget/location_tab_view.dart';
import 'package:wedding_pitch/widget/schedule_tab_view.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with TickerProviderStateMixin {
  final tabs = [
    "일정",
    "위치",
    "예식",
    "기타",
  ];

  late final TabController _tabController =
      TabController(vsync: this, length: tabs.length);

  List<AnimationController> tabWidthAnimationControllers = [];

  int _currentTabIndex = 0;

  @override
  void initState() {
    for (var i = 0; i < tabs.length; i++) {
      tabWidthAnimationControllers.add(
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
      );
    }

    _tabController.addListener(() {
      tabWidthAnimationControllers[_currentTabIndex].reverse();
      setState(() {
        _currentTabIndex = _tabController.index;
      });
      tabWidthAnimationControllers[_currentTabIndex].forward();
    });

    tabWidthAnimationControllers[_currentTabIndex].forward();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in tabWidthAnimationControllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          flexibleSpace: ClipRect(
              // 추가
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
            ),
          )),
          toolbarHeight: 10.0,
          backgroundColor: Colors.white.withOpacity(0.8),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              labelStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              indicatorPadding: EdgeInsets.zero,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              tabs: [
                for (var i = 0; i < tabs.length; i++)
                  AnimatedBuilder(
                      animation: tabWidthAnimationControllers[i],
                      builder: (context, child) {
                        double widthFactor =
                            90 + (30 * tabWidthAnimationControllers[i].value);

                        return Tab(
                          child: SizedBox(
                            width: widthFactor,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                tabs[i],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            LocationTabView(),
            ScheduleTabView(),
            CeremonyTabView(),
            OthersTabView(),
          ],
        ),
      ),
    );
  }
}

class CeremonyTabView extends StatelessWidget {
  const CeremonyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OthersTabView extends StatelessWidget {
  const OthersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
