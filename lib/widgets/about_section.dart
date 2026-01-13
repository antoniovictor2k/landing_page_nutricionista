import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 20,
        vertical: isDesktop ? 100 : 60,
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(
                  child: _buildContent(context, isDesktop),
                ),
                const SizedBox(width: 80),
                Expanded(
                  child: _buildStats(isDesktop),
                ),
              ],
            )
          : Column(
              children: [
                _buildContent(context, isDesktop),
                const SizedBox(height: 40),
                _buildStats(isDesktop),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF2E7D32).withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            'SOBRE MIM',
            style: TextStyle(
              color: Color(0xFF2E7D32),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Transformando Vidas Através da Alimentação',
          style: TextStyle(
            fontSize: isDesktop ? 38 : 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2E7D32),
            height: 1.2,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Sou nutricionista formada pela USP, pós-graduada em Nutrição Clínica e Esportiva, com mais de 10 anos de experiência ajudando pessoas a alcançarem seus objetivos de saúde.',
          style: TextStyle(
            fontSize: isDesktop ? 17 : 16,
            color: Colors.grey[700],
            height: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Acredito que a nutrição vai além de dietas restritivas. Meu objetivo é te ajudar a desenvolver uma relação saudável e prazerosa com a comida, criando hábitos sustentáveis para a vida toda.',
          style: TextStyle(
            fontSize: isDesktop ? 17 : 16,
            color: Colors.grey[700],
            height: 1.8,
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildBadge('CRN-3 12345'),
            _buildBadge('Pós-Graduação USP'),
            _buildBadge('Nutrição Esportiva'),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF2E7D32)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2E7D32),
        ),
      ),
    );
  }

  Widget _buildStats(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 50 : 30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF1B5E20),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildStatItem('10+', 'Anos de Experiência', isDesktop),
          Divider(color: Colors.white.withOpacity(0.3), height: 40),
          _buildStatItem('500+', 'Pacientes Atendidos', isDesktop),
          Divider(color: Colors.white.withOpacity(0.3), height: 40),
          _buildStatItem('95%', 'Satisfação dos Pacientes', isDesktop),
          Divider(color: Colors.white.withOpacity(0.3), height: 40),
          _buildStatItem('100%', 'Dedicação e Empatia', isDesktop),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label, bool isDesktop) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: isDesktop ? 44 : 36,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFF6F00),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isDesktop ? 16 : 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
