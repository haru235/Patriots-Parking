import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  // update a document in Firestore
  Future<void> updateDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref
        .update(data)
        .then((_) => debugPrint('Updated $path: $data'))
        .onError((error, stackTrace) => debugPrint('$error'));
  }

// add a document to a specified collection in Firestore and returns id
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

// delete a document from Firestore
  Future<void> deleteDocument({
    required String path,
  }) async {
    final ref = FirebaseFirestore.instance.doc(path);
    await ref.delete().then((value) => debugPrint('Deleted: $path'));
  }

// delete a collection from Firestore
  Future<void> deleteCollection({
    required String path,
  }) async {
    final instance = FirebaseFirestore.instance;
    final batch = instance.batch();
    final ref = instance.collection(path);
    await ref.get().then((value) {
      for (var doc in value.docs) {
        batch.delete(doc.reference);
      }
    });
    await batch.commit();
  }
}
