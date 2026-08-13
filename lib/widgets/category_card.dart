import 'package:flutter/material.dart';

class KvadratniyContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final String? imagePath;
  final bool? isItlong;
  final Color? color;
  final EdgeInsets? padding;

  const KvadratniyContainer({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    this.imagePath,
    this.isItlong,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.only(left: 11, right: 11, top: 11, bottom: 11),
      decoration: BoxDecoration(
        color: color ?? Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      width: width ?? 86,
      height: height ?? 86,
      child: isItlong == true
          ? Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imagePath != null)
                  Image.asset(imagePath ?? 'assets/icons/frame.png'),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
