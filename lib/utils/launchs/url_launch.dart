import 'package:escritorio_advocacia_especilizado/utils/launchs/urls.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlWhatsApp({required String celular}) async {
  if (!await launchUrl(urlWhatsApp(celular: celular))) {
    throw Exception('Could not launch $urlWhatsApp');
  }
}

Future<void> launchUrlFacebook() async {
  if (!await launchUrl(urlFacebook)) {
    throw Exception('Could not launch $urlWhatsApp');
  }
}

Future<void> launchEmail({required String email, required String descricao, required String assunto}) async {
  if (!await launchUrl(urlEmail(email: email, descricao: descricao, assunto: assunto))) {
    throw 'Could not launch $urlEmail';
  }
}

Future<void> launchUrlInstagram() async {
  if (!await launchUrl(urlInstagram)) {
    throw Exception('Could not launch $urlWhatsApp');
  }
}

Future<void> launchUrlLinkedin() async {
  if (!await launchUrl(urlLinkedin)) {}
  throw Exception('Could not launch $urlWhatsApp');
}
