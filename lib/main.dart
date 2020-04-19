import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/job.dart';
import './services/database.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Job>>.value(
      value: DatabaseService().jobs,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Job Deus',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.yellow[300],
        ),
        home: HomePage(),
      ),
    );
  }
}
