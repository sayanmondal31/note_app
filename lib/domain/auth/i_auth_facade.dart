import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:note_app_ddd/domain/auth/auth_failure.dart';
import 'package:note_app_ddd/domain/auth/value_objects.dart';


// creating a base class which is connecting different auth criteria
abstract class IAuthFacade{
  // 1
  // register with email and password
  // instead of void we are using unit for at right side 
  Future<Either<AuthFailure,Unit>> registerWithEmailAndPAssword({
    @required EmailAddress emailAddress,
    @required Password password
  });

  // 2
  // sign in with email and password 
  Future<Either<AuthFailure,Unit>> signInWithEmailAndPAssword({
    @required EmailAddress emailAddress,
    @required Password password
  });

  // alternative or 3
  // sign in with google 
  Future<Either<AuthFailure,Unit>> signInWithGoogle();

}