import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'pages/home/home.dart';
import 'pages/yaobo/yaobo.dart';
import 'pages/souyao/souyao.dart';
import 'pages/loushi/loushi.dart';

class YJBottomTabbar extends StatefulWidget {
  const YJBottomTabbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _YJBottomTabbar();
  }
}

class _YJBottomTabbar extends State<YJBottomTabbar> {
  int _currentIndex = 0;
  final List<Widget> _pageList = [
    const YJHomePage(),
    const YJYaoboPage(),
    const YJSouyaoPage(),
    const YJLoushiPage(
      id: '',
    )
  ];

  List<BottomNavigationBarItem> _tabbarItemList() {
    final local = AppLocalizations.of(context);
    return [
      BottomNavigationBarItem(
        label: local?.home,
        icon: Image.asset(
          'images/tabbar/home.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'images/tabbar/homeSelect.png',
          width: 24,
          height: 24,
        ),
      ),
      BottomNavigationBarItem(
        label: local?.yaobo,
        icon: Image.asset(
          'images/tabbar/store.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'images/tabbar/storeSelect.png',
          width: 24,
          height: 24,
        ),
      ),
      BottomNavigationBarItem(
        label: local?.souyao,
        icon: Image.asset(
          'images/tabbar/search.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'images/tabbar/searchSelect.png',
          width: 24,
          height: 24,
        ),
      ),
      BottomNavigationBarItem(
        label: local?.loushi,
        icon: Image.asset(
          'images/tabbar/send.png',
          width: 24,
          height: 24,
        ),
        activeIcon: Image.asset(
          'images/tabbar/sendSelect.png',
          width: 24,
          height: 24,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pageList[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFA88B4E),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: _tabbarItemList(),
      ),
    );
  }
}
