import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class OthersTabView extends StatefulWidget {
  const OthersTabView({super.key});

  @override
  State<OthersTabView> createState() => _OthersTabViewState();
}

class _OthersTabViewState extends State<OthersTabView> {
  bool _expanded1 = false;
  bool _expanded2 = false;

  final _controller1 = ExpandableController();
  final _controller2 = ExpandableController();

  @override
  void initState() {
    _controller1.addListener(() {
      setState(() {
        _expanded1 = _controller1.expanded;
      });
    });

    _controller2.addListener(() {
      setState(() {
        _expanded2 = _controller2.expanded;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 60.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Remix.heart_2_line,
                color: Colors.white,
                size: 20.0,
              ),
              backgroundColor: Colors.white,
              iconColor: const Color(0xFFFF3C82),
              title: "마음 전하실 곳",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "참석이 어려우신 분들을 위해 계좌번호를 기재하였습니다. 너그러운 마음으로 양해 부탁드립니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  _makeAccountPanel(
                    controller: _controller1,
                    isExpanded: _expanded1,
                    name: "조재우",
                    bankName: "국민은행",
                    accountNumber: "123456-78-910111",
                    isLast: false,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  _makeAccountPanel(
                    controller: _controller2,
                    isExpanded: _expanded2,
                    name: "고이경",
                    bankName: "국민은행",
                    accountNumber: "123456-78-910111",
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Remix.code_box_fill,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              title: "식사 안내",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "연회장은 지하 1층에 위치해 있습니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    "또한 예식 30분 전부터 식사하실 수 있습니다.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "↘ 연회장 이용시간 : 3:40 - 5:40 (총 2시간)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _makeSection(
              context,
              icon: const Icon(
                Remix.car_line,
                color: Colors.white,
                size: 20.0,
              ),
              iconColor: const Color(0xFFFF823C),
              title: "주차 안내",
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "무료 주차권을 제공해드리고 있습니다. (90분)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    "필요하신 분은 꼭 말씀 부탁드립니다 :)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "↘ 더파티움 건물 내 주차 가능 (중소기업중앙회)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    "↘ 제2주차장 이용 가능 (한국기계회관)",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeAccountPanel({
    required ExpandableController controller,
    required bool isExpanded,
    required bool isLast,
    required String name,
    required String bankName,
    required String accountNumber,
  }) {
    return ExpandablePanel(
      controller: controller,
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToCollapse: true,
        tapBodyToExpand: true,
        useInkWell: true,
        hasIcon: false,
      ),
      header: ExpandableButton(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          decoration: BoxDecoration(
            borderRadius: isExpanded
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )
                : BorderRadius.circular(10),
            color: isExpanded ? Colors.black : const Color(0xFFF9F9F9),
          ),
          child: Text(
            isLast ? "↘ 신부 측 계좌번호" : "↘ 신랑 측 계좌번호",
            style: TextStyle(
              fontSize: 14.0,
              color: isExpanded ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        color: const Color(0xFFF9F9F9),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: Text(name),
              ),
              Text(bankName),
              Text(accountNumber),
            ],
          ),
        ]),
      ),
    );
  }

  Widget _makeSection(
    BuildContext context, {
    required Icon icon,
    required Color iconColor,
    required String title,
    required Widget description,
    Color backgroundColor = const Color(0xFFF9F9F9),
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        border: backgroundColor == Colors.white
            ? Border.all(
                color: Colors.black.withOpacity(0.4),
                width: 0.5,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cirleIcon(
            icon: icon,
            iconColor: iconColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          description,
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }

  Widget _cirleIcon({required Icon icon, required Color iconColor}) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: iconColor,
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
