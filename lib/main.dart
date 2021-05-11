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
      scaffoldBackgroundColor: Color(0xffbde4f5),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black87,
        )
      ),
      appBarTheme: AppBarTheme(
        color: Color(0xffbde4f5),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black87,
        ),
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xffbde4f5),
      ),
      dividerColor: Colors.transparent,
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
        title: Text(
          'Vaccine Slot Checker',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width)/1.5,
              decoration: BoxDecoration(
                color: Color(0xffbde4f5),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff86a2ae),
                    offset: Offset(1.5, 1.5),
                    blurRadius: 3,
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: Color(0xfff4ffff),
                    offset: Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ]
              ),
              child: TextButton(
                child: Text(
                  "Search By PIN",
                  style: TextStyle(
                    color: Colors.black87,
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
                color: Color(0xffbde4f5),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                 boxShadow: [
                   BoxShadow(
                     color: Color(0xff86a2ae),
                     offset: Offset(1.5, 1.5),
                     blurRadius: 3,
                     spreadRadius: 4,
                   ),
                   BoxShadow(
                     color: Color(0xfff4ffff),
                     offset: Offset(-2, -2),
                     blurRadius: 4,
                     spreadRadius: 2,
                   ),
                 ],
              ),
              child: TextButton(
                child: Text(
                  "Search By District",
                  style: TextStyle(
                    color: Colors.black87,
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