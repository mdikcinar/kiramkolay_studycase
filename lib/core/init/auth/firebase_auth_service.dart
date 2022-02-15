import 'package:firebase_auth/firebase_auth.dart';
import '../../init/auth/auth_service_base.dart';

class FirebaseAuthService extends AuthServiceBase {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService(this._firebaseAuth);

  @override
  Future<bool> signOut() async {
    return false;
  }

  Stream<User?> get authStatus => _firebaseAuth.authStateChanges();

  @override
  Future<User?> currentUser() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return currentUser; //_firebaseUserToUserModel(currentUser);
    }
    return null;
  }

  Future<String?> getIdToken() async {
    if (_firebaseAuth.currentUser != null) {
      return await _firebaseAuth.currentUser!.getIdToken();
    }
    return null;
  }
}
