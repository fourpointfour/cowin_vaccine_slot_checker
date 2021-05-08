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
          decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          margin: EdgeInsets.fromLTRB(5, 3, 5, 3),
          child: ExpansionTile(
            title: Text(c[index].name),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Text(c[index].address),
                ),
                Text('Min Age: ${c[index].minAgeLimit}')
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Available slots: ${c[index].availableCapacity}'),
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
