import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.icon,
    this.onTap,
    required this.text1,
    this.isSelected = false,
    this.iconPath,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final String text1;
  final bool isSelected;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? const Color(0xFFF72055)
        : const Color(0xffAAAAAA);

    return Flexible(
      fit: FlexFit.tight,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                data: IconThemeData(color: color),
                child: iconPath != null
                    ? Image.asset(
                        iconPath!,
                        width: 25,
                        height: 25,
                        color: color,
                      )
                    : Icon(icon),
              ),
              const SizedBox(height: 4),
              Text(
                text1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
