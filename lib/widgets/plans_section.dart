import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlansSection extends StatelessWidget {
  const PlansSection({super.key});

  Future<void> _openWhatsApp(BuildContext context, String planName) async {
    const phoneNumber = '5511999999999';
    final message = Uri.encodeComponent('Olá! Tenho interesse no plano $planName');
    
    final url = 'https://wa.me/$phoneNumber?text=$message';
    
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao abrir WhatsApp'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6F00).withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'PLANOS',
              style: TextStyle(
                color: Color(0xFFFF6F00),
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Escolha Seu Plano',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Acompanhamento nutricional personalizado para seus objetivos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 18 : 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: isDesktop ? 60 : 40),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: _buildPlanCard(
                        context,
                        planName: 'Consulta Única',
                        price: 'R\$ 200',
                        features: const [
                          'Avaliação nutricional completa',
                          'Plano alimentar personalizado',
                          'Orientações e dicas',
                          'Suporte por 30 dias via WhatsApp',
                        ],
                        color: const Color(0xFF2E7D32),
                        isPopular: false,
                        isDesktop: isDesktop,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      child: _buildPlanCard(
                        context,
                        planName: 'Acompanhamento Mensal',
                        price: 'R\$ 400',
                        period: '/mês',
                        features: const [
                          'Tudo do plano anterior',
                          '2 consultas de retorno',
                          'Ajustes no plano alimentar',
                          'Acompanhamento de resultados',
                          'Suporte ilimitado via WhatsApp',
                        ],
                        color: const Color(0xFFFF6F00),
                        isPopular: true,
                        isDesktop: isDesktop,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Flexible(
                      child: _buildPlanCard(
                        context,
                        planName: 'Acompanhamento Trimestral',
                        price: 'R\$ 1.000',
                        period: '/3 meses',
                        features: const [
                          'Tudo do plano anterior',
                          '6 consultas de retorno',
                          'Bioimpedância mensal',
                          'Plano de suplementação',
                          'Receitas personalizadas',
                          'Acompanhamento intensivo',
                        ],
                        color: const Color(0xFF1565C0),
                        isPopular: false,
                        isDesktop: isDesktop,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildPlanCard(
                      context,
                      planName: 'Consulta Única',
                      price: 'R\$ 200',
                      features: const [
                        'Avaliação nutricional completa',
                        'Plano alimentar personalizado',
                        'Orientações e dicas',
                        'Suporte por 30 dias via WhatsApp',
                      ],
                      color: const Color(0xFF2E7D32),
                      isPopular: false,
                      isDesktop: isDesktop,
                    ),
                    const SizedBox(height: 24),
                    _buildPlanCard(
                      context,
                      planName: 'Acompanhamento Mensal',
                      price: 'R\$ 400',
                      period: '/mês',
                      features: const [
                        'Tudo do plano anterior',
                        '2 consultas de retorno',
                        'Ajustes no plano alimentar',
                        'Acompanhamento de resultados',
                        'Suporte ilimitado via WhatsApp',
                      ],
                      color: const Color(0xFFFF6F00),
                      isPopular: true,
                      isDesktop: isDesktop,
                    ),
                    const SizedBox(height: 24),
                    _buildPlanCard(
                      context,
                      planName: 'Acompanhamento Trimestral',
                      price: 'R\$ 1.000',
                      period: '/3 meses',
                      features: const [
                        'Tudo do plano anterior',
                        '6 consultas de retorno',
                        'Bioimpedância mensal',
                        'Plano de suplementação',
                        'Receitas personalizadas',
                        'Acompanhamento intensivo',
                      ],
                      color: const Color(0xFF1565C0),
                      isPopular: false,
                      isDesktop: isDesktop,
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context, {
    required String planName,
    required String price,
    String period = '',
    required List<String> features,
    required Color color,
    required bool isPopular,
    required bool isDesktop,
  }) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isDesktop ? 350 : double.infinity,
      ),
      child: Card(
        elevation: isPopular ? 12 : 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: isPopular
              ? BorderSide(color: color, width: 2)
              : BorderSide.none,
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isPopular) ...[
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '⭐ MAIS PROCURADO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              Text(
                planName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (period.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        period,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 28),
              ...features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: color,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _openWhatsApp(context, planName),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Agendar no WhatsApp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
