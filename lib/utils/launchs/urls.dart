Uri urlWhatsApp({required String celular}) {
  return Uri.parse('https://api.whatsapp.com/send?phone=55$celular');
}

final Uri urlFacebook = Uri.parse('https://facebook.com');

Uri urlEmail({required String email, required String descricao, required String assunto}) {
  return Uri.parse(
      'mailto:$email?subject=$assunto&body=$descricao');
}

final Uri urlInstagram = Uri.parse('https://instagram.com');
final Uri urlLinkedin = Uri.parse('https://linkedin.com');

Uri urlWhatsAppImagem({required Uri imagem}) {
  return Uri.parse('whatsapp://send?text=VejaimageUrl$imagem');
}
