import 'package:escritorio_advocacia_especilizado/widgets/app_bar/ui_type_app.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../utils/contantes.dart';
import '../../utils/launchs/url_launch.dart';
import '../../utils/widgets/colors_customs.dart';
import 'app_bar_buttom.dart';

class AppBarPreferredSize extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarPreferredSize({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(60.0); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: CustomColors.background,
        titleSpacing: 0,
        toolbarHeight: height(context: context, size: .1),
        title: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    AppBarButtom(
                        title: 'WhatsApp',
                        typer: AppButtonTyper.text,
                        label: '(42) 9 91160111',
                        onPressed: () => {launchUrlWhatsApp(celular: '(42) 9 91160111')}),
                    AppBarButtom(
                        title: 'Telefone',
                        typer: AppButtonTyper.text,
                        label: '(42) 9 91160111',
                        onPressed: () => {})
                  ],
                ),
              ),
              SizedBox(
                  width: width(context: context, size: .25),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                      width: width(context: context, size: .06),
                      child: AppBarButtom(
                        icon: Mdi.facebook,
                        onPressed: () {
                          launchUrlFacebook();
                        },
                        typer: AppButtonTyper.icon,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: .01, right: .01),
                      child: SizedBox(
                        width: width(context: context, size: .06),
                        child: AppBarButtom(
                          icon: Mdi.instagram,
                          typer: AppButtonTyper.icon,
                          onPressed: () {
                            launchUrlInstagram();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width(context: context, size: .06),
                      child: AppBarButtom(
                        icon: Mdi.linkedin,
                        typer: AppButtonTyper.icon,
                        onPressed: () {
                          launchUrlLinkedin();
                        },
                      ),
                    ),

                  ])),
            ],
          ),
        ));
  }
}
