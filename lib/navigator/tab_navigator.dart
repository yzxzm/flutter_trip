import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final norColor = Colors.grey;
  final activeColor = Colors.blue;
  int _curIndex = 0; //当前页面

  final PageController _pageController = PageController(
    initialPage: 0, //设置初始显示页面
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //选中的时候 图标还在
          currentIndex: _curIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: norColor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: activeColor,
                ),
                title: Text(
                  '首页',
                  style:
                      TextStyle(color: _curIndex == 0 ? activeColor : norColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: norColor,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: activeColor,
                ),
                title: Text(
                  '搜索',
                  style:
                      TextStyle(color: _curIndex == 1 ? activeColor : norColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera,
                  color: norColor,
                ),
                activeIcon: Icon(
                  Icons.camera,
                  color: activeColor,
                ),
                title: Text(
                  '旅拍',
                  style:
                      TextStyle(color: _curIndex == 2 ? activeColor : norColor),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: norColor,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: activeColor,
                ),
                title: Text(
                  '我的',
                  style:
                      TextStyle(color: _curIndex == 3 ? activeColor : norColor),
                )),
          ]),
    );
  }
}
