import 'package:cloud_firestore/cloud_firestore.dart';
import 'custom_exception.dart';

class FirebaseProvider {
  get(Future<QuerySnapshot<Object?>> Function() action) async {
    try {
      await action().then((value) {
        return value;
      }).catchError((error) => throw FetchDataException("internetError"));
    } catch (err) {
      throw FetchDataException("internetError");
    }
  }

  post(Future<DocumentReference<Object?>> Function() action) async {
    try {
      await action().then((value) {
        return value;
      }).catchError((error) => throw FetchDataException("internetError"));
    } catch (err) {
      throw FetchDataException("internetError");
    }
  }
}
