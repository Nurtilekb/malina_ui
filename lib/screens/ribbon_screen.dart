import 'package:flutter/material.dart';
import 'package:malina_ui/widgets/search_input.dart';
import 'package:malina_ui/widgets/ribbon_card.dart';
import 'package:malina_ui/widgets/category_card.dart';

class RibbonScreen extends StatelessWidget {
  const RibbonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> getList = ['Вакансии', 'Маркет', 'Цветы', 'Пожарные'];
    final List<Color> listColor = [
      const Color(0xFFD4E5FF),
      const Color(0xFFFFD3BA),
      const Color(0xFFFFDEDE),
      const Color(0xFFCFF2E3),
    ];

    return Container(
      color: const Color(0xFFFAFAFB),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            AppInputWidget(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              hintText: 'Искать в Malina',
              isBorder: false,
              filledColor: Colors.white,
              leading: const Icon(Icons.search),
            ),
            const SizedBox(height: 15),
            KvadratniyContainer(
              isItlong: true,
              imagePath: 'assets/icons/frame.png',
              width: double.infinity,
              height: null,
              title: 'Сканируй QR-код и заказывай прямо в заведении',
            ),
            const SizedBox(height: 15),
            RibbonBigContainer(
              imagePath: 'assets/images/image1826.png',
              title: 'Бьюти',
              description: 'Салоны красоты и товары',
            ),
            const SizedBox(height: 15),
            RibbonBigContainer(
              imagePath: 'assets/images/image1827.png',
              title: 'Еда',
              description: 'Из кафе и ресторанов',
            ),
            const SizedBox(height: 15),
            const Text(
              'Популярные категории',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  return KvadratniyContainer(
                    color: listColor[index],
                    width: 90,
                    height: 90,
                    title: getList[index],
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
