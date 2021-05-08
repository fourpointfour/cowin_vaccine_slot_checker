import 'package:cowin_vaccine_slot_checker/pages/districtEntries.dart';
import 'package:cowin_vaccine_slot_checker/pages/searchByDistrict.dart';
import 'package:cowin_vaccine_slot_checker/pages/searchByPin.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomeScreen(),
      '/searchByPin': (context) => SearchByPin(),
      '/searchByDistrict': (context) => SearchByDistrict(),
      '/districtEntries': (context) => DistrictEntries(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffab9adf),
      appBar: AppBar(
        title: Text('Vaccine Slot Checker'),
        backgroundColor: Color(0xffab9adf),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: (MediaQuery.of(context).size.width)/3,
              decoration: BoxDecoration(
                color: Color(0xffab9adf),
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff897baf),
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    spreadRadius: 3,
                  ),
                  BoxShadow(
                    color: Color(0xffcdb9ff),
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
                    fontSize: 25,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/searchByPin');
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              // width: (MediaQuery.of(context).size.width)/3,
              decoration: BoxDecoration(
                  color: Color(0xffab9adf),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff897baf),
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                      color: Color(0xffcdb9ff),
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
                    fontSize: 25,
                    color: Colors.black45,
                    fontStyle: FontStyle.italic,
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