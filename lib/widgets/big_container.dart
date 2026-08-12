import 'package:flutter/material.dart';
import 'package:malina_ui/widgets/order_action_button.dart';

class BigContainer extends StatelessWidget {
  const BigContainer({
    super.key,
    required this.restaurantName,
    required this.dishName,
    required this.dishDescription,
    required this.price,
    required this.imagePath,
    required this.buttonText,
    this.quantity = 1,
    this.isNotSingle,
  });

  final String restaurantName;
  final String dishName;
  final String dishDescription;
  final String price;
  final String imagePath;
  final String buttonText;
  final int quantity;
  final bool? isNotSingle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                restaurantName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0xff5F5F5F),
                size: 12,
              ),
            ],
          ),

          const SizedBox(height: 8),

          const Divider(color: Color(0xFFEDEBEB), thickness: 1, height: 1),
          ContainIn(
            imagePath: imagePath,
            dishName: dishName,
            dishDescription: dishDescription,
            price: price,
            quantity: quantity,
          ),
          isNotSingle == true
              ? ContainIn(
                  imagePath: 'assets/images/cream.png',
                  dishName: dishName,
                  dishDescription: dishDescription,
                  price: '2000 с',
                  quantity: quantity,
                )
              : const SizedBox(height: 12),

          const SizedBox(height: 12),
          OrderActionButton(
            text: buttonText,
            price: isNotSingle == true ? '3900 с' : '600 с',
          ),
        ],
      ),
    );
  }
}

class ContainIn extends StatelessWidget {
  const ContainIn({
    super.key,
    required this.imagePath,
    required this.dishName,
    required this.dishDescription,
    required this.price,
    required this.quantity,
  });
  final String imagePath;
  final String dishName;
  final String dishDescription;
  final String price;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dishName,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        dishDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.remove, size: 22),
                          ),
                          Text(
                            ' $quantity ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F8F8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.add, size: 22),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D1D1D),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -5,
            right: -15,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/delete.png',
                width: 34,
                height: 34,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
