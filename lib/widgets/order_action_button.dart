import 'package:flutter/material.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({
    super.key,
    required this.text,
    required this.price,
    this.height1,
    this.wodth1,
    this.radous1,
    this.color1,
    this.textcolor,
  });

  final String text;
  final String? price;

  final double? height1;
  final double? wodth1;
  final double? radous1;
  final Color? color1;
  final Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: const Color(0xFFF72055),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: wodth1 ?? double.infinity,
            height: height1 ?? 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: textcolor?.withValues(alpha: 0.2) ?? Colors.white,
                width: 0.4,
              ),
              color: color1 ?? const Color.fromARGB(33, 247, 32, 86),
              borderRadius: radous1 == null
                  ? BorderRadius.circular(14)
                  : BorderRadius.circular(radous1!),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: price == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textcolor ?? Colors.white,
                    ),
                  ),

                  if (price != null) ...[
                    const Spacer(),
                    Text(
                      price!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
