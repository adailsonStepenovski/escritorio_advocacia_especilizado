import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import '../../utils/contantes.dart';
import '../../utils/controllers/usuario_controller.dart';
import '../../utils/launchs/url_launch.dart';
import '../../utils/models/usuario.dart';
import '../../utils/widgets/colors_customs.dart';
import '../../windows/login_dialog.dart';
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
        backgroundColor:CustomColors.background,
        titleSpacing: 0,
        toolbarHeight: 60,
        title: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors:CustomColors.linearGradinet
                // Adjust the colors as needed
                ),
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
                        label: '(42) 9 91160111',
                        onPressed: () => {launchUrlWhatsApp()}),
                    AppBarButtom(
                        title: 'Telefone',
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
                      child: InkWell(
                        child: const Icon(Mdi.facebook, color: Colors.white),
                        onTap: () {
                          launchUrlFacebook();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: .01, right: .01),
                      child: SizedBox(
                        width: width(context: context, size: .06),
                        child: InkWell(
                          child: const Icon(Mdi.instagram, color: Colors.white),
                          onTap: () {
                            launchUrlInstagram();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width(context: context, size: .06),
                      child: InkWell(
                        child: const Icon(Mdi.linkedin, color: Colors.white),
                        onTap: () {
                          launchUrlLinkedin();
                        },
                      ),
                    ),
                    SizedBox(
                      width: width(context: context, size: .06),
                      child: InkWell(
                        child:
                            const Icon(Mdi.accountCircle, color: Colors.white),
                        onTap: () {

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LoginImputWidget();
                              });
                        },
                      ),
                    ),
                  ])),
            ],
          ),
        ));
  }
}
