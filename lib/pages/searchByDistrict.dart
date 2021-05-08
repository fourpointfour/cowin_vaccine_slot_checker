import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchByDistrict extends StatefulWidget {
  @override
  _SearchByDistrictState createState() => _SearchByDistrictState();
}

class _SearchByDistrictState extends State<SearchByDistrict> {
  // variables for states
  List<String> stateList;
  Map<String, String> stateId = {};
  String _chosenStateId;

  // variables for districts
  List<String> districtList;
  Map<String, String> districtId = {};
  String _chosenDistrictId;

  final String userAgentHeaderForApi = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51';
  final String stateApiRequest = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';
  final String districtApiRequest = 'https://cdn-api.co-vin.in/api/v2/admin/location/districts/';
  Future<void> getStateList() async {
    try {
      Response response = await get(
        Uri.parse(stateApiRequest),
        headers: {'User-Agent': userAgentHeaderForApi},
      );
      if(response.statusCode < 400) {
        dynamic data = jsonDecode(response.body);
        var stateData = data['states'];
        List<String> tempList = [];
        Map<String, String> tempDict = {};
        stateData.forEach((item) {
          tempList.add(item['state_name']);
          tempDict[item['state_name']] = item['state_id'].toString();
        });

        setState(() {
          stateList = tempList;
          stateId = tempDict;
        });
      } else {
        print('Reponse returned with error code: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getDistrictsList(String stateId) async {
    try {
      Response response = await get(
        Uri.parse(districtApiRequest + stateId),
        headers: {'User-Agent':userAgentHeaderForApi},
      );
      if(response.statusCode < 400) {
        dynamic data = jsonDecode(response.body);
        var districtData = data['districts'];
        List<String> tempList = [];
        Map<String, String> tempDict = {};

        districtData.forEach((item) {
          tempList.add(item['district_name']);
          tempDict[item['district_name']] = item['district_id'].toString();
        });

        setState(() {
          districtList = tempList;
          districtId = tempDict;
        });
      } else {
        print('Response returned with error code: ${response.statusCode}');
      }
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getStateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search By District'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (stateList == null) ? CircularProgressIndicator() :
                DropdownButton<String>(
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
                  hint: Text('Select a state'),
                  disabledHint: Text('Button disabled, reload app'),
                  value: _chosenStateId,
                  items: stateList.map<DropdownMenuItem<String>>((String stateName){
                    return DropdownMenuItem<String>(
                      value: stateId[stateName],
                      child: Text(stateName),
                    );
                  }).toList(),
                  onChanged: (String val) async {
                    // _chosenDistrictId is set null so as to set the district
                    // list a null value to render empty list, otherwise it would
                    // lead to an error where there would be a mismatch of
                    // state_id and district_id values
                    _chosenDistrictId = null;

                    // val is the state Id of the selection
                    getDistrictsList(val);
                    setState(() {
                      _chosenStateId = val;
                    });
                  },
                ),
            SizedBox(height: 20),
            (districtList == null) ? SizedBox(height: 5) :
            DropdownButton<String>(
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
              hint: Text('Select district'),
              disabledHint: Text('Select a state first'),
              value: _chosenDistrictId,
              items: districtList.map<DropdownMenuItem<String>>((String districtName){
                return DropdownMenuItem<String>(
                  value: districtId[districtName],
                  child: Text(districtName),
                );
              }).toList(),
              onChanged: (String val) {
                setState(() {
                  _chosenDistrictId = val;
                });
              },
            ),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent[100],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                child: Text('Search', style: TextStyle(color: Colors.black),),
                onPressed: () {
                  if(_chosenStateId != null && _chosenDistrictId != null)
                    Navigator.pushNamed(context, '/districtEntries', arguments: {
                      'state_id': _chosenStateId,
                      'district_id': _chosenDistrictId,
                    });
                  else
                    openSnackBar(context, 'Please select a state and district');
                },
              ),
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