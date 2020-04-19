import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:job_deus_app/models/job.dart';

class JobsList extends StatelessWidget {
  const JobsList({
    Key key,
    @required this.jobs,
  }) : super(key: key);

  final List<Job> jobs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 0, bottom: 0),
              height: 88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 30,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              '${jobs[index].profession}',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                              ),
                              overflow: TextOverflow.ellipsis,
                              stepGranularity: 0.2,
                              maxLines: 2,
                              maxFontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 30,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              '${jobs[index].skill}',
                              style: TextStyle(
                                fontSize: 30,
                                // fontFamily: 'DarkerGrotesque',
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                              stepGranularity: 0.2,
                              maxFontSize: 18,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 75,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.only(
                              right: 7, left: 7, top: 1, bottom: 1),
                          child: Text(jobs[index].level.toUpperCase(),
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.overline)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Freelance',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' (TJM)',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w100,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: jobs[index].avgSalaryFreelance != 0
                                      ? jobs[index]
                                          .avgSalaryFreelance
                                          .toString()
                                      : "N/C",
                                  style: TextStyle(
                                    color: jobs[index].avgSalaryFreelance != 0
                                        ? Colors.orangeAccent
                                        : Colors.black,
                                    fontSize:
                                        jobs[index].avgSalaryFreelance != 0
                                            ? 16
                                            : 14,
                                    fontWeight:
                                        jobs[index].avgSalaryFreelance != 0
                                            ? FontWeight.w400
                                            : FontWeight.w100,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            jobs[index].avgSalaryFreelance != 0
                                                ? ' €'
                                                : '',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                        )),
                                    TextSpan(
                                        text:
                                            jobs[index].avgSalaryFreelance != 0
                                                ? ' HT / jour'
                                                : '',
                                        style: TextStyle(
                                          letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Salarié',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: jobs[index].avgSalaryEmployee != 0
                                      ? jobs[index].avgSalaryEmployee.toString()
                                      : "N/C",
                                  style: TextStyle(
                                      color: jobs[index].avgSalaryEmployee != 0
                                          ? Colors.green
                                          : Colors.black,
                                      fontSize:
                                          jobs[index].avgSalaryEmployee != 0
                                              ? 16
                                              : 14,
                                      fontWeight:
                                          jobs[index].avgSalaryEmployee != 0
                                              ? FontWeight.w400
                                              : FontWeight.w100),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: jobs[index].avgSalaryEmployee != 0
                                            ? ' €'
                                            : '',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic)),
                                    TextSpan(
                                        text: jobs[index].avgSalaryEmployee != 0
                                            ? ' brut / an'
                                            : '',
                                        style: TextStyle(
                                          letterSpacing: 0.5,
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w300,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.lightBlue,
                          ),
                          onPressed: () {
                            final String skill = (jobs[index].skill != '')
                                ? ' - ${jobs[index].skill}'
                                : '';
                            final String skillSubject = (jobs[index].skill != '')
                                ? ' ${jobs[index].skill}'
                                : '';
                            final String level = (jobs[index].level != '')
                                ? ' ${jobs[index].level.toUpperCase()}'
                                : '';
                            final String freelance = (jobs[index]
                                        .avgSalaryFreelance !=
                                    0)
                                ? 'Freelance\(TJM\): ${jobs[index].avgSalaryFreelance}  €  HT/jour\n'
                                : '';
                            final String employee = (jobs[index].avgSalaryEmployee !=
                                    0)
                                ? 'Salarié: ${jobs[index].avgSalaryEmployee}  €  brut/an\n'
                                : '';
                            final String text =
                                'Salaire moyen pour un poste "${jobs[index].profession}' +
                                    skill + level +
                                    '" :\n\n' +
                                    freelance +
                                    employee;
                            final String subject =
                                'JobDeus - ${jobs[index].profession}' + skillSubject + level;

                            Share.share(
                              text,
                              subject: subject,
                            );
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: jobs.length,
      ),
    );
  }
}
