
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../widgets/colors_customs.dart';
import '../widgets/custom_text.dart';
import '../widgets/ui_app_textfield_util.dart';
class TyperAhead extends StatefulWidget {
  final FutureOr<List<dynamic>?> Function(String) suggestionsCallback;
  final dynamic itemBuilder;
  final void Function(dynamic) onSuggestionSelected;
  final APPTextFieldType type;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final String? label;
  final String? errorText;
  final bool? square;
  final bool? login;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? required;
  final bool? enabled;
  final String? subtitle;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onEditingComplete;
  final String Function()? corrigirTextoController;

  const TyperAhead({
    Key? key,
    required this.suggestionsCallback,
    this.itemBuilder,
    required this.onSuggestionSelected,
    required this.type,
    this.preffixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.label,
    this.errorText,
    this.square,
    this.login,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.required,
    this.enabled,
    this.subtitle,
    this.inputFormatters,
    this.onEditingComplete,
    this.corrigirTextoController,
  }) : super(key: key);

  @override
  State<TyperAhead> createState() => _TyperAheadState();
}

bool fieldTapped = false;

class _TyperAheadState extends State<TyperAhead> {
  ValueNotifier<bool> tapped = ValueNotifier<bool>(fieldTapped);
  var fieldFilled = false;

  final FocusNode _focusNode = FocusNode();
  var isPasswordVisible = false;
  late TextEditingController localController;

  @override
  void initState() {
    if (widget.controller == null) {
      localController = TextEditingController();
    }



    _focusNode.addListener(() {
      tapped.value = _focusNode.hasFocus;
      if (!_focusNode.hasFocus && widget.corrigirTextoController != null) {
        widget.controller!.text = widget.corrigirTextoController!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    TextFieldConfig? fieldData;

    final initialLeftPosition = fieldData!.icon == null ? 50.0 : 128.0;
    //widget.login == true ? 808 :
    return SizedBox(
      width: 944,
      height: 208,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 0),
            child: GestureDetector(
              behavior: widget.onTap == null
                  ? HitTestBehavior.translucent
                  : HitTestBehavior.opaque,
              onTap: widget.onTap,
              child: SizedBox(
                width: widget.login == true ? 808 : 944,
                child: Column(
                  children: [
                    TypeAheadField(
                        hideOnLoading: true,
                        hideOnError: true,
                        scrollController: ScrollController(),
                        suggestionsCallback: widget.suggestionsCallback,
                        itemBuilder: widget.itemBuilder,
                        onSelected:widget. onSuggestionSelected,),

                  ],
                ),
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: tapped,
              builder: (context, _, __) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  top: (hasText() || tapped.value)
                      ? 0
                      :  70,
                  left: (hasText() ||
                          tapped.value)
                      ? 40
                      : initialLeftPosition,
                  child: IgnorePointer(
                    child: (tapped.value || fieldFilled)
                        ? Container(
                            height: 32,
                            color: CustomColors.background,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(children: [
                                TextBold(
                                    text: fieldData.label,
                                    fontColor: CustomColors.primary,
                                    fontSize: 28),
                                if (fieldData.isRequired ?? false)
                                  const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: TextBold(
                                        text: "*",
                                        fontColor: CustomColors.primary,
                                        fontSize: 28,
                                      ))
                              ]),
                            ),
                          )
                        : Container(
                            height: 38,
                            color: CustomColors.background,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  TextBold(
                                      text: fieldData.label,
                                      fontColor: CustomColors.textDarkGrey,
                                      fontSize: 32),
                                  if (fieldData.isRequired ?? false)
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: TextBold(
                                          text: "*",
                                          fontColor: CustomColors.primary,
                                          fontSize: 32),
                                    ),
                                ],
                              ),
                            ),
                          ),
                  ),
                );
              }),
          if (fieldData.suffixIcon != null)
            Positioned(
                top: 20,
                right: 0,
                child: Container(
                    width: 144,
                    height: 144,
                    padding: const EdgeInsets.all(24),
                    child: Center(child: fieldData.suffixIcon))),
          if (widget.subtitle != null)
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 48,
                child: TextRegular(
                  text: widget.subtitle,
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                ),
              ),
            )
        ],
      ),
    );
  }

  bool hasText() {
    if (widget.controller == null) return localController.text.isNotEmpty;
    return widget.controller!.text.isNotEmpty;
  }
}
