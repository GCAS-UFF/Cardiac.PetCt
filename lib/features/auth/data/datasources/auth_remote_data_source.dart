import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:petct/core/error/exception.dart';
import 'package:petct/core/resources/firebase_keys.dart';
import 'package:petct/features/auth/data/model/user_model.dart';
import 'package:meta/meta.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(UserModel userModel, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  AuthRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.firebaseDatabase});

  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    try {
      // Create user in firebase authentication
      AuthResult result = await firebaseAuth.createUserWithEmailAndPassword(
          email: userModel.email, password: password);
      // Get the user registred in authentication
      FirebaseUser firebaseUser = result.user;
      // Get user reference in firebase database
      DatabaseReference userReference = firebaseDatabase
          .reference()
          .child(FirebaseKeys.USER_REFERENCE)
          .child(firebaseUser.uid);
      // Save user into database
      await userReference.set(userModel.toJson());
      // Get user from database
      DataSnapshot dataSnapshot = await userReference.once();
      // Return the user
      return UserModel.fromDataSnapshot(dataSnapshot);
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      print("[AuthRemoteDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }
}
