import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthh {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerFirebase(
      String email, String password, BuildContext context) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> updateFirestore(
      String name, String userGender, int height, int weight, int age) async {
    print(auth.currentUser!.uid);
    await _firestore.collection('Person').doc(auth.currentUser!.uid).set({
      'name': name,
      'userGender': userGender,
      'height': height,
      'weight': weight,
      'age': age
    }, SetOptions(merge: true));
  }
}
