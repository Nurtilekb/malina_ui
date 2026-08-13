import 'package:flutter/material.dart';
import 'package:malina_ui/widgets/big_container.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  String _selectedCategory = 'Все';

  final List<String> _categories = ['Все', 'Еда', 'Красота', 'Напитки', 'Дом'];

  final Map<String, List<Map<String, dynamic>>> _favoritesByCategory = {
    'Еда': [
      {
        'restaurantName': 'Bellagio Coffee',
        'dishName': 'Том ям',
        'dishDescription': 'Пицца с соусом том ям 230 гр',
        'price': '450 сом',
        'imagePath': 'assets/images/pizza.png',
      },
      {
        'restaurantName': 'Food House',
        'dishName': 'Бургер Классик',
        'dishDescription': 'Сочный бургер с говядиной 350 гр',
        'price': '380 сом',
        'imagePath': 'assets/images/pizza.png',
      },
    ],
    'Красота': [
      {
        'restaurantName': 'Hair',
        'dishName': 'Hadat Cosmetics',
        'dishDescription': 'Шампунь интенсивно восстанавливающий 250 мл',
        'price': '1900 с',
        'imagePath': 'assets/images/shampoo.png',
      },
      {
        'restaurantName': 'Preen Beauty',
        'dishName': "L'Oreal Paris Elseve",
        'dishDescription': 'Шампунь для ослабленных волос',
        'price': '600 с',
        'imagePath': 'assets/images/elsave.png',
      },
    ],
    'Напитки': [
      {
        'restaurantName': 'Coffee Lab',
        'dishName': 'Латте Карамель',
        'dishDescription': 'Ароматный кофе с карамельным сиропом 350 мл',
        'price': '250 сом',
        'imagePath': 'assets/images/pizza.png',
      },
    ],
    'Дом': [
      {
        'restaurantName': 'Home Store',
        'dishName': 'Свеча ароматическая',
        'dishDescription': 'Свеча с запахом ванили и лаванды',
        'price': '450 сом',
        'imagePath': 'assets/images/pizza.png',
      },
    ],
  };

  List<Map<String, dynamic>> get _filteredItems {
    if (_selectedCategory == 'Все') {
      return _favoritesByCategory.values.expand((i) => i).toList();
    }
    return _favoritesByCategory[_selectedCategory] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFAFAFB),
      child: Column(
        children: [
          // Заголовок и статистика
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Избранное',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF72055),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_getTotalCount()} товаров',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Color(0xFFF72055),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Рейтинг: 4.8',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Горизонтальный скролл категорий
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF72055)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFF72055)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(
                                    0xFFF72055,
                                  ).withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Список товаров
          Expanded(
            child: _filteredItems.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      return Column(
                        children: [
                          BigContainer(
                            restaurantName: item['restaurantName'],
                            dishName: item['dishName'],
                            dishDescription: item['dishDescription'],
                            price: item['price'],
                            imagePath: item['imagePath'],
                            buttonText: 'В корзину',
                            quantity: 1,

                            isNotSingle: index != _filteredItems.length - 1,
                          ),
                          if (index != _filteredItems.length - 1)
                            const SizedBox(height: 12),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFF72055).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border,
              size: 64,
              color: const Color(0xFFF72055),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'В категории "$_selectedCategory" нет товаров',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Выберите другую категорию или\nдобавьте товары в избранное',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedCategory = 'Все';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF72055),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Показать все товары',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  int _getTotalCount() {
    return _favoritesByCategory.values.fold(
      0,
      (sum, list) => sum + list.length,
    );
  }
}
