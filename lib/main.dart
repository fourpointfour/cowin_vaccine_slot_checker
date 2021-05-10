import 'package:cowin_vaccine_slot_checker/pages/districtEntries.dart';
import 'package:cowin_vaccine_slot_checker/pages/searchByDistrict.dart';
import 'package:cowin_vaccine_slot_checker/pages/searchByPin.dart';
import 'package:cowin_vaccine_slot_checker/pages/sessionEntriesByPin.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'RobotoSlab',
      scaffoldBackgroundColor: Color(0xffa87de8),
      appBarTheme: AppBarTheme(
        color: Color(0xffa87de8),
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xffa87de8),
      ),
    ),
    routes: {
      '/': (context) => HomeScreen(),
      '/searchByPin': (context) => SearchByPin(),
      '/sessionEntriesByPin': (context) => SessionEntriesByPin(),
      '/searchByDistrict': (context) => SearchByDistrict(),
      '/districtEntries': (context) => DistrictEntries(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Slot Checker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width)/1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff8f6ac5),
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Color(0xffc190ff),
                    offset: Offset(-1, -1),
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ]
              ),
              child: TextButton(
                child: Text(
                  "Search By PIN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/searchByPin');
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: (MediaQuery.of(context).size.width)/1.5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff8f6ac5),
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                      color: Color(0xffc190ff),
                      offset: Offset(-1, -1),
                      blurRadius: 3,
                      spreadRadius: 2,
                    ),
                  ],
              ),
              child: TextButton(
                child: Text(
                  "Search By District",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/searchByDistrict');
                },
              ),
            ),

            // TODO: uncomment the following button to enable NOTIFY ME
            // ElevatedButton(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Notify Me!'),
            //       Icon(
            //         Icons.lightbulb_outline,
            //       )
            //     ],
            //   ),
            //   onPressed: (){
            //     openSnackBar(context, 'Coming soon!');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

// todo: remove snackbar (main.dart) if not needed
void openSnackBar(BuildContext context, String str)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(str),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
    ),
  );
}