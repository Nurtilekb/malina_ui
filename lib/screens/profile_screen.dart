import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xFFFAFAFB),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          // Заголовок
          const Text(
            'Профиль',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),

          // Карточка пользователя
          _buildUserCard(),
          const SizedBox(height: 24),

          // Разделы профиля
          _buildSectionTitle('Настройки'),
          _buildMenuItem(
            icon: Icons.person_outline,
            title: 'Личные данные',
            subtitle: 'Редактировать профиль',
          ),
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Адреса',
            subtitle: 'Добавить новый адрес',
          ),
          _buildMenuItem(
            icon: Icons.payment_outlined,
            title: 'Способы оплаты',
            subtitle: 'Банковские карты',
          ),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Уведомления',
            subtitle: 'Push и SMS уведомления',
          ),

          const SizedBox(height: 20),
          _buildSectionTitle('Заказы'),
          _buildMenuItem(
            icon: Icons.receipt_long_outlined,
            title: 'Мои заказы',
            subtitle: 'История заказов',
          ),
          _buildMenuItem(
            icon: Icons.favorite_border,
            title: 'Избранное',
            subtitle: 'Сохранённые товары',
          ),

          const SizedBox(height: 20),
          _buildSectionTitle('Поддержка'),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'Помощь',
            subtitle: 'Частые вопросы',
          ),
          _buildMenuItem(
            icon: Icons.chat_bubble_outline,
            title: 'Обратная связь',
            subtitle: 'Напишите нам',
          ),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: 'О приложении',
            subtitle: 'Версия 1.0.0',
          ),

          const SizedBox(height: 30),

          // Кнопка выхода
          OutlinedButton.icon(
            onPressed: () {
              // Логика выхода
            },
            icon: const Icon(Icons.logout, color: Color(0xFFF72055)),
            label: const Text(
              'Выйти',
              style: TextStyle(
                color: Color(0xFFF72055),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFF72055)),
              padding: const EdgeInsets.symmetric(vertical: 14),
              minimumSize: Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildUserCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xFFF72055).withOpacity(0.1),
            child: const Icon(Icons.person, size: 36, color: Color(0xFFF72055)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Иван Иванов',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '+996 555 123 456',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFFF72055)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF72055).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 24, color: const Color(0xFFF72055)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 24),
        ],
      ),
    );
  }
}
