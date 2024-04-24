
import 'package:escritorio_advocacia_especilizado/utils/launchs/urls.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlWhatsApp() async {
  if (!await launchUrl(urlWhatsApp)) {
    throw Exception('Could not launch $urlWhatsApp');
  }
}

Future<void> launchUrlFacebook() async {
  if (!await launchUrl(urlFacebook)) {
    throw Exception('Could not launch $urlWhatsApp');
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
