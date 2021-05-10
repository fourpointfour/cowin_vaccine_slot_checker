import 'dart:convert';
import 'package:cowin_vaccine_slot_checker/classes_and_modules/reusable_functions.dart' as func;
import 'package:cowin_vaccine_slot_checker/classes_and_modules/listViewBuilder_sessions.dart';
import 'package:cowin_vaccine_slot_checker/classes_and_modules/required_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SessionEntriesByPin extends StatefulWidget {
  const SessionEntriesByPin({Key key}) : super(key: key);

  @override
  _SessionEntriesByPinState createState() => _SessionEntriesByPinState();
}

class _SessionEntriesByPinState extends State<SessionEntriesByPin> {
  String _pincode;
  List<VaccinationCenter> centers;
  final String userAgentHeaderForApi = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51';
  final String pinApiRequest = 'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=';

  Future<void> getSessionsByPin(String pincode) async {
    var currDate = DateTime.now();
    String date = currDate.day.toString() + '-' + currDate.month.toString() + '-'
        +  currDate.year.toString() + '-';

    final apiUrl = pinApiRequest + pincode + '&date=' + date;

    try {
      Response response = await get(
        Uri.parse(apiUrl),
        headers: {'User-Agent':userAgentHeaderForApi},
      );
      if(response.statusCode < 400) {
        dynamic data = jsonDecode(response.body);
        var sessions = data['sessions'];
        List<VaccinationCenter> tempList = [];

        sessions.forEach((item) {
          tempList.add(
              VaccinationCenter(
                  centerId: item['center_id'],
                  name: item['name'],
                  address: item['address'],
                  stateName: item['state_name'],
                  districtName: item['district_name'],
                  blockName: item['block_name'],
                  pincode: item['pincode'],
                  from: item['from'],
                  to: item['to'],
                  feeType: item['fee_type'],
                  availableCapacity: item['available_capacity'],
                  fee: item['fee'],
                  minAgeLimit: item['min_age_limit'],
                  vaccineName: item['vaccine'],
                  slots: item['slots']
              )
          );
        });

        // if no centers are available, show the dialog box
        if(tempList.length == 0) {
          await func.showDialog(context, '/searchByPin');
        }

        setState(() {
          centers = tempList;
        });
      } else {
        print('Response returned with error code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSessionsByPin(_pincode));
  }

  @override
  Widget build(BuildContext context) {
    _pincode = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sessions By Pin'),
      ),
      body: Container(
        child: Container(
          // todo: add something to do if no centers are available
          child: (centers == null) ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          ListViewSessions(centers: centers),
          ),
        ),
    );
  }
}


