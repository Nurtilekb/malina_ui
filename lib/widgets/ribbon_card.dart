import 'package:flutter/material.dart';

class RibbonBigContainer extends StatelessWidget {
  const RibbonBigContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFDEDE),
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),

          height: 170,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 18,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
