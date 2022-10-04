import 'package:flutter/material.dart';
import 'package:patriots_parking/resources/firestore_methods.dart';
import 'package:patriots_parking/utils/util.dart';
import 'dart:math';
import 'package:patriots_parking/resources/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//This new File makes the spaces for a row in a parking lot, i suppose each row will need this method call, but thats faster than drawing each space individually.
//in the spacerows method, a void method, the x and y are first estimated by using firebase.  The location of the first space in a row is estimated
//in firebase by updating the x and y in real time, and once a appropiate place is found for that space, just copy the x and y into the method spacerows and
//for spaceCount just say how many spaces from left to right.  7:44AM 10/4/2022
String RandomString(int length) {
  var random = Random();
  return String.fromCharCodes(
      List.generate(length, (index) => random.nextInt(33) + 89));
}

void spacerows(int x, int y, int spaceCount) {
  Map<String, dynamic> temp;
  for (int i = 0; i < spaceCount; i++) {
    String stringtemp = RandomString(20);
    temp = {
      'id': stringtemp,
      'open': true,
      'orientation': 180,
      'parking lot': 'Lot15',
      'x': x,
      'y': y
    };
    x = x + 25;
    addDocument(
      path: '/spaces',
      data: temp,
    );
  }
}

Future<String> addDocument({
  required String path,
  required Map<String, dynamic> data,
  String? myId,
}) async {
  final ref = FirebaseFirestore.instance.collection(path);
  String? id;
  myId == null
      ? await ref
          .add(data)
          .then((doc) {
            id = doc.id;
            doc.update({'id': id});
          })
          .then((_) => debugPrint('Added to $path: $data'))
          .onError((error, stackTrace) => debugPrint('$error'))
      : await ref
          .doc(myId)
          .set(data)
          .then((_) => debugPrint('Added to $path: $data'))
          .onError((error, stackTrace) => debugPrint('$error'));
  return id ?? myId ?? '';
}
