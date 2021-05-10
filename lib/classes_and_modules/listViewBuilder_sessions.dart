import 'package:cowin_vaccine_slot_checker/classes_and_modules/required_classes.dart';
import 'package:flutter/material.dart';

class ListViewSessions extends StatefulWidget {
  const ListViewSessions({Key key, @required this.centers}) : super(key: key);

  final List<VaccinationCenter> centers;

  @override
  _ListViewSessionsState createState() => _ListViewSessionsState();
}

class _ListViewSessionsState extends State<ListViewSessions> {

  @override
  Widget build(BuildContext context) {
    dynamic c = widget.centers;
    return ListView.builder(
      itemCount: c.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(7, 5, 7, 5),
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
          child: ExpansionTile(
            title: Text(
              c[index].name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Text(
                    c[index].address,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  'Min Age: ${c[index].minAgeLimit}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Available slots: ${c[index].availableCapacity}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
