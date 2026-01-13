import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  static bool _isIframeRegistered = false;

  Future<void> _openWhatsApp(BuildContext context) async {
    const phoneNumber = '5511999999999';
    final message = Uri.encodeComponent('Olá! Gostaria de agendar uma consulta nutricional.');
    
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
              'CONTATO',
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
            'Agende Sua Consulta',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isDesktop ? 42 : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2E7D32),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Estou pronta para te ajudar a conquistar seus objetivos',
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
                  children: [
                    Expanded(
                      child: _buildContactInfo(context, isDesktop),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 2,
                      child: _buildMap(isDesktop),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _buildContactInfo(context, isDesktop),
                    const SizedBox(height: 40),
                    _buildMap(isDesktop),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          icon: Icons.location_on,
          title: 'Endereço',
          subtitle: 'Rua das Flores, 500\nJardins, São Paulo - SP\nCEP: 01452-000',
          color: const Color(0xFF2E7D32),
        ),
        const SizedBox(height: 30),
        _buildContactItem(
          icon: Icons.phone,
          title: 'Telefone/WhatsApp',
          subtitle: '(11) 99999-9999',
          color: const Color(0xFF2E7D32),
        ),
        const SizedBox(height: 30),
        _buildContactItem(
          icon: Icons.email,
          title: 'E-mail',
          subtitle: 'dra.anapaulacosta@nutricao.com',
          color: const Color(0xFF2E7D32),
        ),
        const SizedBox(height: 30),
        _buildContactItem(
          icon: Icons.access_time,
          title: 'Horário de Atendimento',
          subtitle: 'Segunda a Sexta: 8h às 19h\nSábado: 8h às 13h',
          color: const Color(0xFF2E7D32),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _openWhatsApp(context),
            icon: const Icon(Icons.chat, size: 20),
            label: const Text('Agendar no WhatsApp'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6F00),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMap(bool isDesktop) {
    const String viewType = 'google-maps-iframe-nutri';
    
    if (!_isIframeRegistered) {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        viewType,
        (int viewId) {
          final iframe = html.IFrameElement()
            ..style.border = 'none'
            ..style.height = '100%'
            ..style.width = '100%'
            ..src = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.1974373856434!2d-46.6566406!3d-23.5614488!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sRua%20das%20Flores%2C%20500%20-%20Jardins%2C%20S%C3%A3o%20Paulo%20-%20SP!5e0!3m2!1spt-BR!2sbr!4v1642000000000!5m2!1spt-BR!2sbr'
            ..allowFullscreen = true;
          return iframe;
        },
      );
      _isIframeRegistered = true;
    }

    return Container(
      height: isDesktop ? 500 : 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const HtmlElementView(viewType: viewType),
      ),
    );
  }
}
