import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quickalert/quickalert.dart';

final _db = FirebaseFirestore.instance;

Future<bool> checkExist(String rno, context) async {

  print(rno);
  try {    
    DocumentSnapshot snapshot =
        await _db.collection("registered").doc(rno).get();
    if (snapshot.exists) {
      print("Exists");
      return true;
    } else {
      return false;
    }
  } catch (error) {
    print(error);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      text: 'Check your network connection',
    );
  }
  return false;
}

Future<void> admitUser(rno) async {
  await _db.collection("admitted").doc(rno).set({});
  await removeUser(rno);
}

Future<void> removeUser(String rno) async {

  final CollectionReference registeredCollection = _db.collection("registered");
  await registeredCollection.doc(rno).delete();
}

void bulkAdd(data) async {
  print("Adding");
  for (String i in data) {
    await _db.collection("registered").doc(i).set({});
  }
  print("Added");
}

String removeSpaces(String input) {
  return input.replaceAll(RegExp(r'\s'), '');
}