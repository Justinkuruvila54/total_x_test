import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Homescreeencontroller with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void _saveData() {
    String name = nameController.text;
    int age = int.tryParse(ageController.text) ?? 0; // Convert age to integer
    // Add data to Firestore
    FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'age': age,
    });
    // Clear text fields after saving
    nameController.clear();
    ageController.clear();
  }
}
