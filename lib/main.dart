import 'package:cowin_vaccine_slot_checker/pages/searchByDistrict.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    routes: {
      '/': (context) => HomeScreen(),
      // '/searchByPIN': (context) => SearchByPin(),
      '/searchByDistrict': (context) => SearchByDistrict(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccine Slots'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Search By PIN"),
              onPressed: (){
                openSnackBar(context, 'Coming soon!');
              },
            ),
            ElevatedButton(
              child: Text("Search By District"),
              onPressed: (){
                Navigator.pushNamed(context, '/searchByDistrict');
              },
            ),
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notify Me!'),
                  Icon(
                    Icons.lightbulb_outline,
                  )
                ],
              ),
              onPressed: (){
                openSnackBar(context, 'Coming soon!');
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
