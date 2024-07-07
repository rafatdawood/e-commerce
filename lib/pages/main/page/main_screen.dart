import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cart/page/cart_screen.dart';
import '../../favorites/page/favorites_screen.dart';
import '../../home/page/home_screen.dart';
import '../../orders/page/orders_screen.dart';
import '../../settings/page/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  List screens = [
    FavoritesScreen(),
    OrdersScreen(),
    HomeScreen(),
    CartScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20.sp,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/wishlist.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/wishlist_a.svg',
            ),
            label: '_',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/categories.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/categories_a.svg',
            ),
            label: '_',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shop.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/shop_a.svg',
            ),
            label: '_',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/cart.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/cart_a.svg',
            ),
            label: '_',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            activeIcon: SvgPicture.asset(
              'assets/icons/profile_a.svg',
            ),
            label: '_',
          ),
        ],
      ),
    );
  }
}
