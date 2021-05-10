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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 9),
                    border: InputBorder.none,
                    hintText: 'Enter your pincode',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
                    'Search',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if(_formKey.currentState.validate()) {
                      setState(() {
                        errorMessage = '';
                      });
                      // open district entries by pincode page
                      Navigator.pushNamed(context, '/sessionEntriesByPin', arguments: _pincode);
                    } else {
                      setState(() {
                        errorMessage = 'Please enter a valid pincode';
                      });
                    }
                  },
                ),
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