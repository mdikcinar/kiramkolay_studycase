import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServiceBase {
  Future<User?> currentUser();
  Future<bool> signOut();
}
