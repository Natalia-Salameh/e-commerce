import 'package:ecommerce/core/constants/colors.dart';
import 'package:ecommerce/core/constants/iconasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const NavigationBarWidget({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 76,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 1,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: CustomColors.navBarColor,
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(CustomIconAsset.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(CustomIconAsset.heart),
                label: 'Wishlist',
              ),
              BottomNavigationBarItem(
                icon: Container(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(CustomIconAsset.navSearch),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(CustomIconAsset.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 26,
          left: MediaQuery.of(context).size.width / 2 - 28,
          child: FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: CustomColors.backgroundColor,
            onPressed: () {},
            child: SvgPicture.asset(CustomIconAsset.navCart),
          ),
        ),
      ],
    );
  }
}
