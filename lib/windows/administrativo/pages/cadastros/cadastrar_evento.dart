

import 'package:escritorio_advocacia_especilizado/core/controllers/events_controller.dart';
import 'package:escritorio_advocacia_especilizado/core/models/eventos.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mdi/mdi.dart';
import '../../../../utils/contantes.dart';
import '../../../../widgets/widgets/colors_customs.dart';
import '../../../../widgets/widgets/custom_text.dart';
import '../../../../widgets/widgets/ui_app_textfield.dart';
import '../../../../widgets/widgets/ui_web_button.dart';
import '../../../../widgets/src/ui_dialog_web.dart';

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

  List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow];

  @override
  void initState() {
    super.initState();
  }


  Color selectedColor = Colors.grey; // Initial color (can be customized)
  int selectedColorValue = 0; // Initial integer value

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
    return _colorMap[color] ?? 0; // Return 0 if color not found in map
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
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: width(context: context, size: .4),
                        child: CustomTextField(
                          label: 'Título',
                          controller: tituloController,
                          prefixIcon: const Icon(Mdi.accountCircle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, bottom: 8),
                        child: Center(
                          child: PopupMenuButton<Color>(
                            onSelected: setColor,
                            initialValue: selectedColor,
                            child: CircleAvatar(backgroundColor: selectedColor),
                            itemBuilder: (BuildContext context) => const [
                              PopupMenuItem<Color>(
                                value: Colors.grey,
                                child:
                                    CircleAvatar(backgroundColor: Colors.grey),
                              ),
                              PopupMenuItem<Color>(
                                value: Colors.blue,
                                child:
                                    CircleAvatar(backgroundColor: Colors.blue),
                              ),
                              PopupMenuItem<Color>(
                                value: Colors.green,
                                child:
                                    CircleAvatar(backgroundColor: Colors.green),
                              ),
                              PopupMenuItem<Color>(
                                value: Colors.orange,
                                child: CircleAvatar(
                                    backgroundColor: Colors.orange),
                              ),
                              PopupMenuItem<Color>(
                                value: Colors.yellow,
                                child: CircleAvatar(
                                    backgroundColor: Colors.yellow),
                              ),
                              PopupMenuItem<Color>(
                                value: Colors.red,
                                child:
                                    CircleAvatar(backgroundColor: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Descrição',
                      maxLines: 5,
                      controller: descricaoController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ), Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'com quem',
                      maxLines: 5,
                      controller: descricaoController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
    Row(
      children: [
        ValueListenableBuilder<DateTime>(
        valueListenable: dataInicio,
        builder: (context, value, _) {
        return SizedBox(
                      height: 80,
                      width: width(context: context, size: .2),
                      child: InkWell(
                        onTap: () {
                          _mostrarDatePickerInicio(context);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.oldStandardTt(
                                  color: CustomColors.lightGrey,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none),
                              hintText: 'Selecione a data e hora de Inicio',
                              border: OutlineInputBorder(),
                              label: TextBold(
                                  text: 'Selecione a data e hora de Inicio',
                                  fontSize: 16)),
                          child: Text(DateFormat('dd/MM/yyyy HH:mm')
                              .format(dataInicio.value)),
                        ),
                      ),
                    );}), ValueListenableBuilder<DateTime>(
        valueListenable: dataFim,
        builder: (context, value, _) {
        return SizedBox(
                      height: 80,
                      width: width(context: context, size: .2),
                      child: InkWell(
                        onTap: () {
                          _mostrarDatePickerfim(context);
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                              hintStyle: GoogleFonts.oldStandardTt(
                                  color: CustomColors.lightGrey,
                                  fontSize: 24,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none),
                              hintText: 'Selecione a data e hora de fim',
                              border: OutlineInputBorder(),
                              label: TextBold(
                                  text: 'Selecione a data e hora de fim',
                                  fontSize: 16)),
                          child: Text(DateFormat('dd/MM/yyyy HH:mm')
                              .format(dataFim.value)),
                        ),
                      ),
                    );}),
      ],
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
                          dataFinal: dataFim.value,
                          dataInicio: dataInicio.value),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],

    );
  }void _mostrarDatePickerInicio(BuildContext context) {
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
  }void _mostrarDatePickerfim(BuildContext context) {
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
