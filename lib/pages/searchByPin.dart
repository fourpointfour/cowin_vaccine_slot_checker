import 'package:flutter/material.dart';

class SearchByPin extends StatefulWidget {
  const SearchByPin({Key key}) : super(key: key);

  @override
  _SearchByPinState createState() => _SearchByPinState();
}

class _SearchByPinState extends State<SearchByPin> {
  String _pincode;
  String errorMessage = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search By PINCODE'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your pincode',
                  ),
                  validator: (value) {
                    if(value.length < 6 || value.length > 6 || value == null || value.isEmpty) {
                      return "Please enter a valid pincode";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    setState(() {
                      _pincode = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 5,),
              // error message with icon
              // Text(
              //   errorMessage,
              //   style: TextStyle(
              //     fontSize: 10,
              //     color: Colors.red,
              //   ),
              // ),
              SizedBox(height: 15,),
              // button to search
              TextButton(
                child: Text('Search'),
                onPressed: () {
                  openSnackBar(context, 'Coming soon!');
                  // if(_formKey.currentState.validate()) {
                  //   setState(() {
                  //     errorMessage = '';
                  //   });
                  //   // open district entries by pincode page
                  // } else {
                  //   setState(() {
                  //     errorMessage = 'Please enter a valid pincode';
                  //   });
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// todo: remove snackbar (searchByPin.dart) if not needed
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