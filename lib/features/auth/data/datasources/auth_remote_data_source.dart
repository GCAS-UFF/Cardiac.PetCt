import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:petct/core/error/exception.dart';
import 'package:petct/core/resources/firebase_keys.dart';
import 'package:petct/features/auth/data/model/user_model.dart';
import 'package:meta/meta.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(UserModel userModel, String password);

  Future<String> signIn(String email, String password);

  Future<void> sendEmailVerification();

  Future<bool> confirmEmailVerified();

  Future<void> signOut();

  Future<void> recoverPassword(String email);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  AuthRemoteDataSourceImpl(
      {@required this.firebaseAuth, @required this.firebaseDatabase});

  @override
  Future<UserModel> signUp(UserModel userModel, String password) async {
    return await sendRequest(makeRequest: () async {
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
      // Send email verification
      sendEmailVerification();
      // Return the user
      return UserModel.fromDataSnapshot(dataSnapshot);
    });
  }

  @override
  Future<bool> confirmEmailVerified() async {
    return await sendRequest(makeRequest: () async {
      FirebaseUser user = await firebaseAuth.currentUser();
      user.reload();
      return user.isEmailVerified;
    });
  }

  @override
  Future<void> recoverPassword(String email) async {
    return await sendRequest(makeRequest: () async {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    });
  }

  @override
  Future<void> sendEmailVerification() async {
    return await sendRequest(makeRequest: () async {
      FirebaseUser user = await firebaseAuth.currentUser();
      user.sendEmailVerification();
    });
  }

  @override
  Future<String> signIn(String email, String password) async {
    String userId;
    bool isEmailVerified;

    await sendRequest(makeRequest: () async {
      AuthResult result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      userId = result.user.uid;
      isEmailVerified = result.user.isEmailVerified;
    });

    if (userId == null) {
      throw ServerException();
    } else if (!isEmailVerified) {
      throw EmailNotVerifiedException();
    } else {
      return userId;
    }
  }

  @override
  Future<void> signOut() async {
    return await sendRequest(makeRequest: () async {
      return firebaseAuth.signOut();
    });
  }

  // Function to get all exceptions
  Future<dynamic> sendRequest({@required Function makeRequest}) async {
    try {
      return await makeRequest();
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      print("[AuthRemoteDataSourceImpl] ${e.toString()}");
      throw ServerException();
    }
  }
}
