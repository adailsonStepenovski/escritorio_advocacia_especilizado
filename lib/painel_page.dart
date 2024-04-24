
import 'package:escritorio_advocacia_especilizado/widgets/app_bar/app_bar_cutoms.dart';
import 'package:escritorio_advocacia_especilizado/widgets/bottom_widget.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/compilance_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/escritorio_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/fale_conosco_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/home_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/noticia_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mdi/mdi.dart';
import 'widgets/buttons_home.dart';
import 'windows/website/web/areas_de_atuacao_page.dart';

class PainelPage extends StatefulWidget {
  const PainelPage({super.key});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  Widget page = const HomePage(); // Initial page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPreferredSize(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            launchUrl(
                Uri.parse('https://api.whatsapp.com/send?phone=5542991160111'));
          },
          tooltip: 'Redirecionando...',
          child: const Icon(Mdi.whatsapp)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonsHome(
              onPressedHome: () {
                _navigateToScreen(context, 3); // Home Page
              },
              onPressedEscritorio: () {
                _navigateToScreen(context, 1); // Escritorio Page
              },
              onPressedAreasAtuacao: () {
                _navigateToScreen(context, 0); // Areas de Atuacao Page
              },
              onPressedCompliance: () {
                _navigateToScreen(context, 2); // Compliance Page
              },
              onPressedNoticias: () {
                _navigateToScreen(context, 4); // Noticias Page
              },
              onPressedFaleConosco: () {
                _navigateToScreen(context, 5); // Fale Conosco Page
              },
            ),
            page, const BottomWidegt()
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        page = const AreaDeAtuacaoPage();
        break;
      case 1:
        page = const EscritorioPage();
        break;
      case 2:
        page = const CompilancePage();
        break;
      case 3:
        page = const HomePage();
        break;
      case 4:
        page = const NoticiasPage();
        break;
      case 5:
        page = const FaleConoscoPage();
        break;
      default:
        return;
    }

    setState(() {}); // Trigger a rebuild to update the displayed content
  }
}
