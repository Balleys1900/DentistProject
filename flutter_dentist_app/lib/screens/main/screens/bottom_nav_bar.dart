import 'package:flutter/material.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({
    Key? key,
    required this.selected,
    required this.eventHandler,
  }) : super(key: key);

  final int selected;
  final Function eventHandler;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_view_outlined),
          label: 'Đặt lịch',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Thông báo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: 'Tài khoản',
        ),
      ],
      currentIndex: selected,
      onTap: (index) => {eventHandler(index)},
      // backgroundColor: Colors.black,
    );
  }
}
