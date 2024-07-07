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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: CustomColors.textFieldHintColor, blurRadius: 1),
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
            icon: Container(
              width: 53.85,
              height: 56,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    blurRadius: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.09),
                    offset: Offset(0, 2))
              ]),
              child: IconButton(
                icon: SvgPicture.asset(CustomIconAsset.navCart),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
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
    );
  }
}
