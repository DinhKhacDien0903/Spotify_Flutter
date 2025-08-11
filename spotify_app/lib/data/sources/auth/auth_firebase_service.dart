import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<void> signup(CreateUserRequest request);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {
    // Implement Firebase sign-in logic here
  }

  @override
  Future<void> signup(CreateUserRequest request) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
    } on FirebaseAuthException catch (e) {
    } catch (e) {}
  }
}
