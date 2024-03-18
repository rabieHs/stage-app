import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stage_app/models/user.dart';

class AuthenticationController {
  Future<bool> register(
      String email, String password, String name, String type) async {
    final userModel = UserModel(name: name, email: email, type: type);
    final user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (user.user != null) {
      userModel.id = user.user!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toMap());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (result.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    final id = FirebaseAuth.instance.currentUser!.uid;
    final result =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    final data = result.data() as Map<String, dynamic>;

    final user = UserModel.fromMap(data);

    return user;
  }
}
