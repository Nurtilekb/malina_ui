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
  OverlayEntry? _overlayEntry;

  void _toggle() {
    if (_isExpanded) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _showOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _toggle,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: Colors.transparent)),

            Positioned(
              right: 12,
              bottom: 75,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 70,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _CartOption(
                        icon: 'assets/icons/food.png',
                        title: 'Еда',
                        onTap: _openFood,
                      ),
                      const SizedBox(height: 10),
                      _CartOption(
                        icon: 'assets/icons/cosmetic.png',
                        title: 'Товары',
                        onTap: _openProducts,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _openFood() {
    _removeOverlay();
    setState(() {
      _isExpanded = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShoppingCartScreen(isItFood: true)),
    );
  }

  void _openProducts() {
    _removeOverlay();
    setState(() {
      _isExpanded = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShoppingCartScreen(isItFood: null)),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Container(
        width: 70,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 22,
              color: _isExpanded
                  ? const Color(0xFFF72055)
                  : const Color(0xffAAAAAA),
            ),
            const SizedBox(height: 4),
            Text(
              'Корзина',
              style: TextStyle(
                fontSize: 10,
                color: _isExpanded
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
