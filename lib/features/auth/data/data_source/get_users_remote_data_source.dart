import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twigconnect/core/firebase_provider.dart';
import 'package:twigconnect/features/auth/data/models/users_model.dart';

abstract class GetUsersRemoteDataSource {
  Future<UserModel> getUsers();

  CollectionReference<Object?> getCollocation(String collectionId);
}

class GetUsersRemoteDataSourceImpl implements GetUsersRemoteDataSource {
  final FirebaseProvider firebaseProvider;

  GetUsersRemoteDataSourceImpl({required this.firebaseProvider});

  @override
  Future<UserModel> getUsers() async {
    final Stream<QuerySnapshot> jsonResponse =   getCollocation("users").snapshots();

    jsonResponse.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      return ListTile(
        title: Text(data['full_name']),
        subtitle: Text(data['company']),
      );
    }).toList(),
    final data = UserModel.fromJson(  jsonResponse.data()! as Map<String, dynamic>);
    return data;
  }

  @override
  CollectionReference<Object?> getCollocation(String collectionId) {
    CollectionReference collectionObj = FirebaseFirestore.instance.collection(collectionId);
    return collectionObj;
  }
}
