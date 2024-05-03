
final Uri urlWhatsApp = Uri.parse('https://api.whatsapp.com/send?phone=5542991160111');
final Uri urlFacebook = Uri.parse('https://facebook.com');
final Uri urlInstagram= Uri.parse('https://instagram.com');
final Uri urlLinkedin= Uri.parse('https://linkedin.com');
 Uri urlWhatsAppImagem({required Uri imagem}) {
  return Uri.parse('whatsapp://send?text=VejaimageUrl$imagem');
}