import 'package:flutter/material.dart';
import 'package:malina_ui/widgets/big_container.dart';
import 'package:malina_ui/widgets/order_action_button.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key, required this.isItFood});
  final bool? isItFood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        forceMaterialTransparency: true,
        title: const Text(
          'Корзина',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Очистить',
              style: TextStyle(
                color: Color(0xff1D1D1D),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
            child: Row(
              children: [
                OrderActionButton(
                  text: 'Доставка',
                  price: null,
                  radous1: 20,
                  height1: 40,
                  wodth1: MediaQuery.of(context).size.width * 0.45,
                ),
                Spacer(),
                OrderActionButton(
                  color1: Color.fromARGB(255, 255, 255, 255),
                  textcolor: Color(0xff1D1D1D),
                  text: 'В заведение',
                  price: null,
                  radous1: 20,
                  height1: 40,
                  wodth1: MediaQuery.of(context).size.width * 0.45,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                if (isItFood == true)
                  BigContainer(
                    restaurantName: 'Bellagio Coffee',
                    dishName: 'Том ям',
                    dishDescription: 'Пицца с соусом том ям 230 гр',
                    price: '450 сом',
                    imagePath: 'assets/images/pizza.png',
                    buttonText: 'Заказать',
                    quantity: 1,
                  ),
                if (isItFood == null)
                  BigContainer(
                    isNotSingle: true,
                    restaurantName: 'Hair',
                    dishName: 'Hadat Cosmetics',
                    dishDescription:
                        'Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл',
                    price: '1900 с',
                    imagePath: 'assets/images/shampoo.png',
                    buttonText: 'Заказать',
                    quantity: 1,
                  ),
                if (isItFood == null)
                  BigContainer(
                    isNotSingle: false,
                    restaurantName: 'Preen Beauty',
                    dishName: 'L’Oreal Paris Elseve',
                    dishDescription: ' Шампунь для ослабленных волос',
                    price: '600 с',
                    imagePath: 'assets/images/elsave.png',
                    buttonText: 'Заказать',
                    quantity: 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
