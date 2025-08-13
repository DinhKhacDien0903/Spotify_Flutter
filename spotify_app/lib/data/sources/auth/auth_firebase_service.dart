import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/create_user_request.dart';
import 'package:spotify_app/data/models/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest request);
  Future<Either> signup(CreateUserRequest request);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest request) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred: ';
      switch (e.code) {
        case 'invalid-email':
          message = 'Not user found for that email';
        case 'invalid-credential':
          message = 'Wrong password provided for that user';
      }

      return Left(message);
    } catch (e) {
      return Left(e.hashCode);
    }
  }

  @override
  Future<Either> signup(CreateUserRequest request) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      // FirebaseFirestore.instance.collection('Users').add({
      //   'fullName': data.user?.displayName ?? request.fullName,
      //   'email': data.user?.email ?? request.email,
      // });

      return Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred: ';
      switch (e.code) {
        case 'weak-password':
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
