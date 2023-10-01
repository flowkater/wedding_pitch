import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wedding_pitch/style/size.dart';
import 'package:wedding_pitch/widget/ceremony_tab_view.dart';
import 'package:wedding_pitch/widget/location_tab_view.dart';
import 'package:wedding_pitch/widget/others_tab_view.dart';
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
    final appSize = AppSize.getMaxSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    final screenWidth = appSize.width;
    final tabWidth = screenWidth / (tabs.length + 1);

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ),
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
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
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
                            tabWidth + tabWidthAnimationControllers[i].value;

                        return Tab(
                          child: SizedBox(
                            width: widthFactor,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                tabs[i],
                                style: const TextStyle(
                                  fontSize: 15,
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
            ScheduleTabView(),
            LocationTabView(),
            CeremonyTabView(),
            OthersTabView(),
          ],
        ),
      ),
    );
  }
}
