import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';


class CommonBottomNavigationBar extends StatelessWidget {
  const CommonBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NavigationViewModel>(context);

    return BottomAppBar(
      shape: CurvedNotchedRectangle(borderRadius: 16.0),
      notchMargin: 8.0,
      color: wCustomColor,
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
        onTap: viewModel.onTabTapped,
        currentIndex: viewModel.currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: bCustomColor,
        unselectedItemColor: dlbCustomColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.transparent),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_rounded),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}


class CurvedNotchedRectangle extends NotchedShape {
  final double borderRadius;

  CurvedNotchedRectangle({this.borderRadius = 16.0});

  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()..addRect(host);
    }
    final radius = borderRadius;

    final notchPath = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.left - radius, host.top)
      ..arcToPoint(
        Offset(guest.left, host.top + radius),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(guest.left, guest.bottom - radius)
      ..arcToPoint(
        Offset(guest.left + radius, guest.bottom),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(guest.right - radius, guest.bottom)
      ..arcToPoint(
        Offset(guest.right, guest.bottom - radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(guest.right, host.top + radius)
      ..arcToPoint(
        Offset(guest.right + radius, host.top),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();

    return notchPath;
  }
}




class NavigationViewModel with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
