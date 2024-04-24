import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/agenda.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/atendimentos.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/contatos.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/documentos.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/financeiro.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/processos_casos.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/widgets/custom_drawer.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/widgets/icon_dashboard.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/web/areas_de_atuacao_page.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import 'pages/area_trabalho.dart';

class HomePageAdm extends StatefulWidget {
  const HomePageAdm({super.key});

  @override
  State<HomePageAdm> createState() => _HomePageAdmState();
}

class _HomePageAdmState extends State<HomePageAdm> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AreaTrabalhoPage(label: 'Dashboard 1'),
    AreaTrabalhoPage(label: 'Dashboard 1'),
    AgendaPage(label: 'Dashboard 2'),
    ContatosPage(label: 'Dashboard 3'),
    AtendimentoPage(label: 'Dashboard 3'),
    ProcessoCasosPage(label: 'Dashboard 3'),
    FinanceiroPage(label: 'Dashboard 3'),
    DocumentoPage(label: 'Dashboard 3'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: [

                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _onItemTapped,
                  labelType: NavigationRailLabelType.all,useIndicator: false,
                  backgroundColor: CustomColors.background,
                  destinations:    [
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label:IconDashboard( icon:
                              Mdi.viewDashboard,
                              text:
                            'Area de Trabalho',
                          ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label:IconDashboard( icon:
                          Mdi.calendar,
                         text:
                          'Agenda',)

                    ),NavigationRailDestination(
                      icon: SizedBox(),
                      label: IconDashboard( icon:
                          Mdi.account,
                          text:

                          'Contato',
                      )
                    ),
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label: IconDashboard( icon:
                          Mdi.chat,
                          text:
                          'Atendimentos',
                      )
                    ),
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label: IconDashboard( icon:
                          Mdi.pasta,
                          text:
                          'Processo e Casos',
                         ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label: IconDashboard( icon:
                          Mdi.currencyUsd,
                        text:
                          'Financeiro',
                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox(),
                      label: IconDashboard( icon:
                          Mdi.fileDocument,
                          text:
                          'Documentos',
                       ),
                    ),

                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),


    );
  }
}