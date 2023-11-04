import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_meet_sdk/google_meet_sdk.dart';

final CollectionReference mainCollection =
    FirebaseFirestore.instance.collection('event');
final DocumentReference documentReference = mainCollection.doc('test');

class Storage {
  Future<void> storeEventData(GoogleMeetEventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    debugPrint('DATA:\n$data');

    await documentReferencer.set(data).whenComplete(() {
      debugPrint("Event added to the database, id: {${eventInfo.id}}");
    }).catchError((e) => debugPrint(e));
  }

  Future<void> updateEventData(GoogleMeetEventInfo eventInfo) async {
    DocumentReference documentReferencer =
        documentReference.collection('events').doc(eventInfo.id);

    Map<String, dynamic> data = eventInfo.toJson();

    debugPrint('DATA:\n$data');

    await documentReferencer.update(data).whenComplete(() {
      debugPrint("Event updated in the database, id: {${eventInfo.id}}");
    }).catchError((e) => debugPrint(e));
  }

  Future<void> deleteEvent({required String id}) async {
    DocumentReference documentReferencer =
        documentReference.collection('events').doc(id);
    await documentReferencer.delete().catchError((e) => debugPrint(e));
    debugPrint('Event deleted, id: $id');
  }

  Stream<QuerySnapshot> retrieveEvents() {
    Stream<QuerySnapshot> myClasses =
        documentReference.collection('events').orderBy('start').snapshots();

    return myClasses;
  }
}
