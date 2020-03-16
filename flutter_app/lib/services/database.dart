import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/book.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/models/users.dart';
class DatabaseService{
  //
  final String uid;
  DatabaseService({this.uid});


  //Collection reference
  final CollectionReference bookCollection = Firestore.instance.collection('Users');
  final CollectionReference userCollection = Firestore.instance.collection('UserList');

  Future updateUserData(String name, String author, int deadline) async {
    return await bookCollection.document(uid).collection('books').document(author).setData({
      'name' : name,
      'author' : author,
      'deadline' : deadline,
      'uid' : uid,
    });
  }


  Future updateUserList(String pictid) async {
    if(userCollection.document(pictid).get() == null) {
      return await userCollection.document(pictid).setData({
        'uid' : uid,
      });
    }
    else {
      return null;
    }

  }


}
