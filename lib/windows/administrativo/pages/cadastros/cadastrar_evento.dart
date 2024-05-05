import 'package:escritorio_advocacia_especilizado/core/controllers/events_controller.dart';
import 'package:escritorio_advocacia_especilizado/core/models/cliente.dart';
import 'package:escritorio_advocacia_especilizado/core/models/endereco.dart';
import 'package:escritorio_advocacia_especilizado/core/models/eventos.dart';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import '../../../../core/controllers/cliente_service.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/colors_customs.dart';
import '../../../../utils/widgets/custom_text.dart';
import '../../../../utils/widgets/font_style.dart';
import '../../../../utils/widgets/ui_app_textfield.dart';
import '../../../../utils/widgets/ui_web_button.dart';
import '../../../../widgets/src/ui_dialog_web.dart';
import '../../home_page_adm.dart';
import 'cadastrar_cliente.dart';

class CadastrarEvento extends StatefulWidget {
  const CadastrarEvento({Key? key}) : super(key: key);

  @override
  State<CadastrarEvento> createState() => _CadastrarEventoState();
}

class _CadastrarEventoState extends State<CadastrarEvento> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  ValueNotifier<DateTime> dataInicio = ValueNotifier(DateTime.now());
  ValueNotifier<DateTime> dataFim = ValueNotifier(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  TextEditingController controller = TextEditingController(text: '');
  ValueNotifier<Cliente?> cliente = ValueNotifier<Cliente?>(null);
  Color selectedColor = Colors.blue; // Initial color (can be customized)
  int selectedColorValue = 1; // Initial integer value

  // Color list with integer mappings
  final Map<Color, int> _colorMap = {
    Colors.grey: 0,
    Colors.blue: 1,
    Colors.green: 2,
    Colors.orange: 3,
    Colors.yellow: 4,
    Colors.red: 5
  };

  // Function to map color to integer value
  int getColorValue(Color color) {
    return _colorMap[color] ?? 1; // Return 0 if color not found in map
  }

  void setColor(Color color) {
    setState(() {
      selectedColor = color;
      selectedColorValue = getColorValue(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return UIWhiteDialog(
      content: [
        Row(
          children: [
            SizedBox(
              height: 80,
              width: width(context: context, size: .43),
              child: CustomTextField(
                label: 'Título',
                controller: tituloController,
                prefixIcon: const Icon(Mdi.accountCircle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 16),
              child: Center(
                child: PopupMenuButton<Color>(
                  onSelected: setColor,
                  initialValue: selectedColor,
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(backgroundColor: selectedColor)),
                  itemBuilder: (BuildContext context) => const [
                    PopupMenuItem<Color>(
                      value: Colors.grey,
                      child: CircleAvatar(backgroundColor: Colors.grey),
                    ),
                    PopupMenuItem<Color>(
                      value: Colors.blue,
                      child: CircleAvatar(backgroundColor: Colors.blue),
                    ),
                    PopupMenuItem<Color>(
                      value: Colors.green,
                      child: CircleAvatar(backgroundColor: Colors.green),
                    ),
                    PopupMenuItem<Color>(
                      value: Colors.orange,
                      child: CircleAvatar(backgroundColor: Colors.orange),
                    ),
                    PopupMenuItem<Color>(
                      value: Colors.yellow,
                      child: CircleAvatar(backgroundColor: Colors.yellow),
                    ),
                    PopupMenuItem<Color>(
                      value: Colors.red,
                      child: CircleAvatar(backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 80,
          child: CustomTextField(
            label: 'Descrição',
            maxLines: 5,
            controller: descricaoController,
            prefixIcon: const Icon(Mdi.lock),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
          ),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                width: width(context: context, size: .43),
                child: ValueListenableBuilder(
                    valueListenable: cliente,
                    builder: (context, value, child) {
                      return TypeAheadField<Cliente>(
                        controller: controller,
                        builder: (context, controller, focusNode) => TextField(
                          controller: controller,
                          focusNode: focusNode,
                          autofocus: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Clientes',
                          ),
                          style: fontOldStandardTt(
                            color: CustomColors.textBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        decorationBuilder: (context, child) => Material(
                          type: MaterialType.card,
                          elevation: 4,
                          borderRadius: BorderRadius.circular(5),
                          child: child,
                        ),
                        itemBuilder: (context, product) => ListTile(
                          title: TextBold(
                            text: product.nome,
                            fontSize: 20,
                          ),
                          subtitle: TextMedium(
                            text: product.email,
                            fontSize: 18,
                          ),
                        ),
                        onSelected: (clientes) {
                          controller.text = clientes.nome;
                          cliente.value = clientes;
                        },
                        suggestionsCallback: (search) async {
                          final clientes =
                              await ClientesService().getClientes(search);
                          return clientes ?? [];
                        },
                      );
                    }),
              ),
              InkWell(
                child: Icon(Mdi.plus),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CadastrarCliente();
                      });
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 18.0,
          ),
          child: Row(
            children: [
              ValueListenableBuilder<DateTime>(
                  valueListenable: dataInicio,
                  builder: (context, value, _) {
                    return SizedBox(
                      height: 90,
                      width: width(context: context, size: .232),
                      child: InkWell(
                        onTap: () {
                          _mostrarDatePickerInicio(context);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                              hintStyle: fontOldStandardTt(
                                color: CustomColors.lightGrey,
                                fontSize: 24,
                                fontStyle: FontStyle.normal,
                              ),
                              hintText: 'Selecione a data e hora de Inicio',
                              border: const OutlineInputBorder(),
                              label: const TextBold(
                                  text: 'Selecione a data e hora de Inicio',
                                  fontSize: 16)),
                          child: Text(DateFormat('dd/MM/yyyy HH:mm')
                              .format(dataInicio.value)),
                        ),
                      ),
                    );
                  }),
              ValueListenableBuilder<DateTime>(
                  valueListenable: dataFim,
                  builder: (context, value, _) {
                    return Padding(
                        padding: const EdgeInsets.only(left: 18.0, bottom: 8),
                        child: SizedBox(
                          height: 90,
                          width: width(context: context, size: .232),
                          child: InkWell(
                            onTap: () {
                              _mostrarDatePickerfim(context);
                            },
                            child: InputDecorator(
                              decoration: InputDecoration(
                                  hintStyle: fontOldStandardTt(
                                    color: CustomColors.lightGrey,
                                    fontSize: 24,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  hintText: 'Selecione a data e hora de fim',
                                  border: const OutlineInputBorder(),
                                  label: const TextBold(
                                      text: 'Selecione a data e hora de fim',
                                      fontSize: 16)),
                              child: Text(DateFormat('dd/MM/yyyy HH:mm')
                                  .format(dataFim.value)),
                            ),
                          ),
                        ));
                  }),
            ],
          ),
        ),
        UIAppButton(
          buttonHeight: height(context: context, size: 0.08),
          buttonWidth: width(context: context, size: 0.2),
          label: 'Cadastrar',
          isLoading: false,
          onPressed: () async {
            final EventsService eventsService = EventsService();
            eventsService.adicionarEvento(
              Evento(
                  title: tituloController.text,
                  descricao: descricaoController.text,
                  allDay: false,
                  color: selectedColorValue,
                  cliente: cliente.value,
                  dataFinal: dataFim.value,
                  dataInicio: dataInicio.value),
            );
            eventsService.getEventos();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomePageAdm(
                        pageSelected: 1,
                      )),
            );
          },
        ),
      ],
    );
  }

  void _mostrarDatePickerInicio(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: dataInicio.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year,
    ).then((DateTime? selectedDate) {
      if (selectedDate != null) {
        // Se uma data for selecionada, mostra o time picker
        _mostrarTimePickerInicio(context, selectedDate);
      }
    });
  }

  void _mostrarTimePickerInicio(BuildContext context, DateTime selectedDate) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    ).then((TimeOfDay? selectedTime) {
      if (selectedTime != null) {
        DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        dataInicio.value = selectedDateTime;
      }
    });
  }

  void _mostrarDatePickerfim(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: dataFim.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.year,
    ).then((DateTime? selectedDate) {
      if (selectedDate != null) {
        // Se uma data for selecionada, mostra o time picker
        _mostrarTimePickerfim(context, selectedDate);
      }
    });
  }

  void _mostrarTimePickerfim(BuildContext context, DateTime selectedDate) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
    ).then((TimeOfDay? selectedTime) {
      if (selectedTime != null) {
        DateTime selectedDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        dataFim.value = selectedDateTime;
      }
    });
  }
}
