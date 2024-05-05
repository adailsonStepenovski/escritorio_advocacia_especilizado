
import 'package:escritorio_advocacia_especilizado/windows/website/web/area_atuacao/areas_de_atuacao_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/acesso_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/escritorio/escritorio_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/fale_conosco_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/home_page/home_page.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/noticia/noticia_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/controllers/usuario_controller.dart';
import 'core/models/usuario.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'painel_page.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) async {
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  userController
      .efetuarLogin(
      'juridicoTeste@teste.com', 'juridicoTeste')
      .then((Usuario? usuario) {
    if (usuario != null) {

    } else {
    }
  });
  runApp(const MyApp());
});
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escritório Advocacia',debugShowCheckedModeBanner: false,debugShowMaterialGrid: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes:{
        "/HomePage": (_) =>  const PainelPage(page: HomePage()),
        "/EscritorioPage": (_) =>  const PainelPage(page: EscritorioPage()),
        "/CompilancePage": (_) => const PainelPage(page: AcessoRestritoPage()),
        "/AreasDeAtuacaoPage": (_) =>  const PainelPage(page: AreaDeAtuacaoPage()),
        "/NoticiasPage": (_) => const PainelPage(page: NoticiasPage()),
        "/FaleConoscoPage": (_) => const PainelPage(page: FaleConoscoPage()),
      },
      home:   const PainelPage(page: AcessoRestritoPage(),),
    );
  }
}

