import 'dart:convert';
import 'package:cowin_vaccine_slot_checker/classes_and_modules/required_classes.dart';
import 'package:cowin_vaccine_slot_checker/classes_and_modules/listViewBuilder_sessions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DistrictEntries extends StatefulWidget {
  @override
  _DistrictEntriesState createState() => _DistrictEntriesState();
}

class _DistrictEntriesState extends State<DistrictEntries> {
  final String userAgentHeaderForApi = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51';
  final String apiRequestForCenters = 'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?';
  // https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=664&date=7-5-2021

  // do not change the values of 'arguments' accidentally, LOL
  var args;
  List<VaccinationCenter> centers;
  // the following variables will be used while displaying filtered ages
  var minAge = double.minPositive, maxAge = double.maxFinite;

  Future<void> getCenterList() async {
    var currDate = DateTime.now();

    String date = currDate.day.toString() + '-' + currDate.month.toString() + '-'
                  +  currDate.year.toString() + '-';


    final apiRequestUrl = apiRequestForCenters + 'district_id=' + args['district_id']
                          + '&date=' + date;

    try {
      Response response = await get(
        Uri.parse(apiRequestUrl),
        headers: {'User-Agent': userAgentHeaderForApi},
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

        setState(() {
          centers = tempList;
        });

      } else {
        print('Response returned with error code: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception Thrown: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getCenterList());
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('Centers Available'),
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
