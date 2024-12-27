import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class FireStoreService {
  final CollectionReference data =
  FirebaseFirestore.instance.collection("userDetails");

  /// Add a user details
  Future<void> addUserDetail(String username, String email) {
    return data.add({'name': username, 'emailId': email});
  }
  /// Get user detail
  Stream<QuerySnapshot> getUserDetails() {
    final userStream = data.orderBy('name',descending: true).snapshots();
    return userStream;
  }
  /// Update a user detail
  Future<void> updateUserDetail(String docId, String name, String email){
    return data.doc(docId).update({
      'name' : name,
      'emailId' : email
    });
  }

  /// Delete a user detail
  Future<void> deleteUserDetail(String docId) {
    return data.doc(docId).delete();
  }
}

class LastLoginController {

  Future<List<SavedDataEntry>> getSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(await prefs.getStringList('savedData'));
    List<String> savedData = await prefs.getStringList('savedData') ?? [];
    print(savedData.toString());
    return savedData.map((entry) => SavedDataEntry.fromString(entry)).toList();
  }


  Future<void> updateSavedData(List<SavedDataEntry> entries) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedData = entries.map((entry) => entry.toString()).toList();
    await prefs.setStringList('savedData', updatedData);
  }


  Future<bool> deleteEntry(String qrData) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}
