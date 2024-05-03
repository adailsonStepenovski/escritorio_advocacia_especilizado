
import 'package:escritorio_advocacia_especilizado/widgets/app_bar/app_bar_cutoms.dart';
import 'package:escritorio_advocacia_especilizado/widgets/bottom_widget.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/acesso_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/escritorio/escritorio_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/fale_conosco_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/home_page/home_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/noticia/noticia_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mdi/mdi.dart';
import 'widgets/buttons_home.dart';
import 'windows/website/web/area_atuacao/areas_de_atuacao_page.dart';
class PainelPage extends StatefulWidget {
  final Widget page;
  const PainelPage({super.key, required this.page});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  late Widget page; // Initial page

  @override
  void initState() {
    super.initState();
    page = widget.page;
  }
  ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPreferredSize(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launchUrl(Uri.parse('https://api.whatsapp.com/send?phone=5542991160111'));
        },
        tooltip: 'Redirecionando...',
        child: const Icon(Mdi.whatsapp),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonsHome(
              onPressedHome: () => _navigateToScreen(3),
              onPressedEscritorio: () => _navigateToScreen(1),
              onPressedAreasAtuacao: () => _navigateToScreen(0),
              onPressedNoticias: () => _navigateToScreen(4),
              onPressedFaleConosco: () => _navigateToScreen(5),
              onPressedAcessoRestrito: () => _navigateToScreen(2),
            ),
            page,
            const BottomWidegt(),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(int index,) {
    setState(() {
      switch (index) {
        case 0:
          page =  const AreaDeAtuacaoPage();
          break;
        case 1:
          page =  const EscritorioPage();
          break;
        case 2:
          page = const AcessoRestritoPage();
          break;
        case 3:
          page =  const HomePage();
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
    });
  }
}
