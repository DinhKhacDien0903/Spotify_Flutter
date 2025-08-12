import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin();
  Future<Either> signup(CreateUserRequest request);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() async {
    // Implement Firebase sign-in logic here
  }

  @override
  Future<Either> signup(CreateUserRequest request) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred: ';
      switch (e.code) {
        case 'waek-password':
          message = 'The password provided is too waek';
        case 'email-already-in-use':
          message = 'An account already with that email';
      }

      return Left(message);
    } catch (e) {
      return Left(e.hashCode);
    }
  }
}
