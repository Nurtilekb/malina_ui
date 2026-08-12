import 'package:flutter/material.dart';
import 'package:malina_ui/screens/ribbon_screen.dart';
import 'package:malina_ui/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const RibbonScreen(),
      const PlaceholderContentScreen(
        title: 'Содержимое избранного',
        icon: Icons.favorite,
      ),
      const PlaceholderContentScreen(title: 'Профиль', icon: Icons.person),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: IndexedStack(index: _selectedIndex, children: pages),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: SizedBox(
          child: CustomBottomNavBar(
            selectedIndex: _selectedIndex,
            onItemTapped: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class PlaceholderContentScreen extends StatelessWidget {
  const PlaceholderContentScreen({
    required this.title,
    required this.icon,
    super.key,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48, color: const Color(0xFFF72055)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          PopupMenuButton<String>(
            position: PopupMenuPosition.over,
            icon: const Icon(Icons.arrow_drop_up),
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Option 1',
                child: Text('Option 1'),
              ),
              const PopupMenuItem<String>(
                value: 'Option 2',
                child: Text('Option 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
