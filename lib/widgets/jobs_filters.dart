import 'package:flutter/material.dart';

class JobsFilters extends StatelessWidget {
  const JobsFilters({
    Key key,
    @required this.jobFilters,
    @required this.jobFilterValue,
    @required this.setJobFilter,
  }) : super(key: key);

  final List<String> jobFilters;
  final String jobFilterValue;
  final Function setJobFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            child: Text(
              'Job Deus'.toUpperCase(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'DarkerGrotesque', fontSize: 20,fontWeight: FontWeight.w800, height: 1),
            ),
          ),
          Container(
            child: Container(
              padding: EdgeInsets.only(bottom: 2, top: 2),
              child: DropdownButton<String>(
                value: jobFilterValue,
                style: TextStyle(
                  fontFamily: 'DarkerGrotesque',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
                underline: Container(
                  height: 1,
                  color: Colors.black,
                ),
                items: <String>[...jobFilters].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: setJobFilter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
