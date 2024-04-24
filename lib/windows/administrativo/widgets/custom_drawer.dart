import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() {
    return new CustomDrawerState();
  }

  CustomDrawer();
}

class CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {



    return Drawer(
        child: Scrollbar(
            child: Container(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .1, left: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    menuButton(context, 'Favoritos',
                                        Icons.monitor_heart, false, () {}),

                                    menuButton(context, 'Sair', Icons.exit_to_app, true,
                                            () {
                                          doLogout(context);
                                        }),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CupertinoButton(
                                      onPressed: () {
                                        ;
                                      },
                                      child: Text(
                                        'Versão',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    CupertinoButton(
                                      onPressed: () {},
                                      child: Text(
                                        'F.A.Q',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            )));
  }

  separator(context) {
    return Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 2,
        color: Colors.grey[200]);
  }

  Widget menuButton(context, text, icon, isLogout, onPress) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 15),
                Icon(
                  icon,
                  color: !isLogout ? Colors.white : Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                    child: Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                //Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ));
  }

  doLogout(context) async {

  }
}