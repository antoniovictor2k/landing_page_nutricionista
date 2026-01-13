import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    final services = [
      {
        'icon': Icons.restaurant_menu,
        'title': 'Reeducação Alimentar',
        'description': 'Aprenda a ter uma relação saudável com a comida e crie hábitos duradouros.',
      },
      {
        'icon': Icons.fitness_center,
        'title': 'Nutrição Esportiva',
        'description': 'Plano alimentar específico para melhorar seu desempenho e resultados.',
      },
      {
        'icon': Icons.favorite,
        'title': 'Emagrecimento Saudável',
        'description': 'Perca peso de forma sustentável sem dietas restritivas e sofrimento.',
      },
      {
        'icon': Icons.child_care,
        'title': 'Nutrição Infantil',
        'description': 'Orientação nutricional para crianças e adolescentes.',
      },
      {
        'icon': Icons.pregnant_woman,
        'title': 'Nutrição para Gestantes',
        'description': 'Acompanhamento nutricional durante a gestação e amamentação.',
      },
      {
        'icon': Icons.healing,
        'title': 'Nutrição Clínica',
        'description': 'Tratamento nutricional para diabetes, hipertensão e outras condições.',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 20,
        vertical: isDesktop ? 100 : 60,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2E7D32).withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'SERVIÇOS',
              style: TextStyle(
                color: Color(0xFF2E7D32),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Como Posso Te Ajudar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Atendimento personalizado focado nas suas necessidades',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 18 : 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: isDesktop ? 60 : 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isDesktop ? 3 : (size.width > 480 ? 2 : 1),
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isDesktop ? 1.0 : 1.1,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return _buildServiceCard(
                icon: service['icon'] as IconData,
                title: service['title'] as String,
                description: service['description'] as String,
                isDesktop: isDesktop,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDesktop,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 28 : 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: isDesktop ? 40 : 36,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop ? 19 : 17,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isDesktop ? 15 : 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
