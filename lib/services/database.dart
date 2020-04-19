import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/job.dart';

class DatabaseService {
  final Firestore _firestore = Firestore.instance;

  Stream<List<Job>> get jobs {
    return _firestore
            .collection('jobs')
            .orderBy('skill')
            .snapshots()
            .map((snapshot) {
          return snapshot.documents.where((doc) {
            if (doc.data['profession'] == null ||
                (doc.data['profession'] is String) == false ||
                ((doc.data['skill'] != null &&
                    (doc.data['skill'] is String) == false)) ||
                ((doc.data['level'] != null &&
                    (doc.data['level'] is String) == false)) ||
                ((doc.data['avg_salary_freelance'] != null &&
                    (doc.data['avg_salary_freelance'] is int) == false)) ||
                ((doc.data['avg_salary_employee'] != null &&
                    (doc.data['avg_salary_employee'] is int) == false))) {
              return false;
            }
            return true;
          }).map((doc) {
            return Job(
              profession: doc.data['profession'],
              skill: doc.data['skill'],
              level: doc.data['level'] ?? "",
              avgSalaryFreelance: doc.data['avg_salary_freelance'] ?? 0,
              avgSalaryEmployee: doc.data['avg_salary_employee'] ?? 0,
            );
          }).toList();
        }) ??
        [];
  }
}
