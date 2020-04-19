import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/job.dart';
import 'package:job_deus_app/widgets/jobs_list.dart';
import 'package:job_deus_app/widgets/jobs_filters.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _allJobsFilter = 'Tous les jobs';
  String _jobFilterValue = 'Tous les jobs';

  void _setJobFilter(String jobFilterChoice) {
    setState(() {
      _jobFilterValue = jobFilterChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Job> jobs = Provider.of<List<Job>>(context) ?? [];
    List<Job> jobsFiltered = [];
    final List<String> jobFilters = [...jobs]
        .map((job) => job.profession)
        .toSet()
        .toList(); //take professions > toSet to take off duplicates > toList()
    jobFilters.insert(0, _allJobsFilter);
    jobsFiltered = (_jobFilterValue == _allJobsFilter)
        ? [...jobs]
        : [...jobs].where((job) => job.profession == _jobFilterValue).toList();
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: jobs.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    // strokeWidth: 6,
                    // backgroundColor: Colors.black,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    JobsFilters(
                        jobFilters: jobFilters,
                        jobFilterValue: _jobFilterValue,
                        setJobFilter: _setJobFilter),
                    JobsList(jobs: jobsFiltered),
                  ],
                ),
        ),
      ),
    );
  }
}
