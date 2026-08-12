import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:malina_ui/screens/button_showing.dart';
import 'package:malina_ui/widgets/bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: BottomNavItem(
                      iconPath: 'assets/icons/ribbon.png',
                      icon: Icons.home,
                      text1: 'Лента',
                      isSelected: selectedIndex == 0,
                      onTap: () => onItemTapped(0),
                    ),
                  ),

                  Expanded(
                    child: BottomNavItem(
                      icon: Icons.favorite,
                      text1: 'Избранное',
                      isSelected: selectedIndex == 1,
                      onTap: () => onItemTapped(1),
                    ),
                  ),

                  const SizedBox(width: 85),

                  Expanded(
                    child: BottomNavItem(
                      icon: Icons.person,
                      text1: 'Профиль',
                      isSelected: selectedIndex == 2,
                      onTap: () => onItemTapped(2),
                    ),
                  ),

                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          ),

          // SCANNER
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: InkWell(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AiBarcodeScanner(
                        galleryButtonType: GalleryButtonType.none,
                        onDetect: (BarcodeCapture capture) {},
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ColoredBox(
                    color: const Color(0xFFF72055),
                    child: Image.asset(
                      'assets/icons/scan_frame.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // CART
          Positioned(
            right: 12,
            bottom: 2,
            child: AnimatedCartButton(isSelected: selectedIndex == 3),
          ),
        ],
      ),
    );
  }
}
