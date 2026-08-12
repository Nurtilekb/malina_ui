import 'package:flutter/material.dart';
import 'package:malina_ui/widgets/big_container.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFAFAFB),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          const Text(
            'Избранное',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          
          // Товары в избранном
          BigContainer(
            restaurantName: 'Bellagio Coffee',
            dishName: 'Том ям',
            dishDescription: 'Пицца с соусом том ям 230 гр',
            price: '450 сом',
            imagePath: 'assets/images/pizza.png',
            buttonText: 'В корзину',
            quantity: 1,
            isFavorite: true,
          ),
          const SizedBox(height: 12),
          
          BigContainer(
            isNotSingle: true,
            restaurantName: 'Hair',
            dishName: 'Hadat Cosmetics',
            dishDescription:
                'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл',
            price: '1900 с',
            imagePath: 'assets/images/shampoo.png',
            buttonText: 'В корзину',
            quantity: 1,
            isFavorite: true,
          ),
          const SizedBox(height: 12),
          
          BigContainer(
            isNotSingle: false,
            restaurantName: 'Preen Beauty',
            dishName: "L'Oreal Paris Elseve",
            dishDescription: ' Шампунь для ослабленных волос',
            price: '600 с',
            imagePath: 'assets/images/elsave.png',
            buttonText: 'В корзину',
            quantity: 1,
            isFavorite: true,
          ),
          
          const SizedBox(height: 30),
          
          // Пустое состояние (если нет избранных товаров)
          if (false) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'У вас пока нет избранных товаров',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Добавляйте товары в избранное, чтобы быстро их находить',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
