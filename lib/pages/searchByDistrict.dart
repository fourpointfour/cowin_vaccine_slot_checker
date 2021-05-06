import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SearchByDistrict extends StatefulWidget {
  @override
  _SearchByDistrictState createState() => _SearchByDistrictState();
}

class _SearchByDistrictState extends State<SearchByDistrict> {
  List<String> stateList;
  Map<String, int> stateId;
  var _chosenStateId;
  final String stateApiRequest = 'https://cdn-api.co-vin.in/api/v2/admin/location/states';
  Future<void> getStateList() async {
    Response response = await get(Uri.parse(stateApiRequest));
    print('Response status code: ${response.statusCode}');
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
          children: [
            (stateList == null) ? CircularProgressIndicator() :
                DropdownButton<String>(
                  value: _chosenStateId,
                  items: stateList.map<DropdownMenuItem<String>>((String stateName){
                    return DropdownMenuItem<String>(
                      value: stateId[stateName].toString(),
                      child: Text(stateName),
                    );
                  }),
                ),
          ],
        ),
      ),
    );
  }
}
