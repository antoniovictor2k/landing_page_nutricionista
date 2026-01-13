import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FloatingWhatsAppButton extends StatelessWidget {
  const FloatingWhatsAppButton({super.key});

  Future<void> _openWhatsApp(BuildContext context) async {
    const phoneNumber = '5511999999999'; // Substitua pelo número da nutricionista
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
    return Tooltip(
      message: 'Fale conosco no WhatsApp',
      child: FloatingActionButton.extended(
        onPressed: () => _openWhatsApp(context),
        backgroundColor: const Color(0xFF25D366),
        icon: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
        label: const Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
