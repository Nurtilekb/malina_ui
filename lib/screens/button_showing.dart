import 'package:flutter/material.dart';
import 'package:malina_ui/screens/shopping_cart_screen.dart';

class AnimatedCartButton extends StatefulWidget {
  final bool isSelected;

  const AnimatedCartButton({super.key, required this.isSelected});

  @override
  State<AnimatedCartButton> createState() => _AnimatedCartButtonState();
}

class _AnimatedCartButtonState extends State<AnimatedCartButton> {
  bool _isExpanded = false;

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _openFood() {
    setState(() {
      _isExpanded = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShoppingCartScreen(isItFood: true)),
    );
  }

  void _openProducts() {
    setState(() {
      _isExpanded = false;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShoppingCartScreen(isItFood: null)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        width: 70,
        height: _isExpanded ? 190 : 60,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(_isExpanded ? 20 : 15),
        ),
        child: _isExpanded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CartOption(
                    icon: 'assets/icons/food.png',
                    title: 'Еда',
                    onTap: _openFood,
                  ),

                  const SizedBox(height: 6),

                  _CartOption(
                    icon: 'assets/icons/cosmetic.png',
                    title: 'Товары',
                    onTap: _openProducts,
                  ),

                  const SizedBox(height: 6),

                  const Icon(
                    Icons.shopping_cart,
                    size: 20,
                    color: Color(0xffAAAAAA),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    'Корзина',
                    style: TextStyle(fontSize: 10, color: Color(0xffAAAAAA)),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    size: 22,
                    color: widget.isSelected
                        ? const Color(0xFFF72055)
                        : const Color(0xffAAAAAA),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Корзина',
                    style: TextStyle(
                      fontSize: 10,
                      color: widget.isSelected
                          ? const Color(0xFFF72055)
                          : const Color(0xffAAAAAA),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CartOption extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _CartOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xffF5F5F6),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 18, height: 18),
            const SizedBox(height: 1),
            Text(
              title,
              style: const TextStyle(fontSize: 8, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
