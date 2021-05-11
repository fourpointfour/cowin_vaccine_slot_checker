import 'package:flutter/material.dart';

Future<void> showDialog(BuildContext context, String popUntilRoute) async {
  showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 200,
          width: 300,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Centers available!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffbde4f5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff86a2ae),
                        offset: Offset(1.5, 1.5),
                        blurRadius: 3,
                        spreadRadius: 3,
                      ),
                      BoxShadow(
                        color: Color(0xfff4ffff),
                        offset: Offset(-1.5, -1.5),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextButton(
                    child: Text(
                      'Okay',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName(popUntilRoute));
                    },
                  ),
                ),
              ],
            ),
          ),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Color(0xffbde4f5),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Color(0xff86a2ae),
                offset: Offset(1.5, 1.5),
                blurRadius: 3,
                spreadRadius: 3,
              ),
              BoxShadow(
                color: Color(0xfff4ffff),
                offset: Offset(-1.5, -1.5),
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}