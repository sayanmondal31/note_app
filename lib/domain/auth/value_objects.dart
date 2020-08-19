import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app_ddd/core/failures.dart';
import 'package:note_app_ddd/core/value_objects.dart';
import 'package:note_app_ddd/core/value_validator.dart';



class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  // //either is union of two values , left is for falure and rifgt is for success or true value
  // final Either<Left, Right> falure;

  factory EmailAddress(String input) {
    //input not be null
    assert(input != null);

    return EmailAddress._(
        //get email from user and validate the iput if it is proper email address or not
        value: validateEmailAddress(input));
  }

  //private constructor for email address
  const EmailAddress._({
    this.value,
  });
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;
  // //either is union of two values , left is for falure and rifgt is for success or true value
  // final Either<Left, Right> falure;

  factory Password(String input) {
    //input not be null
    assert(input != null);

    return Password._(
        //get email from user and validate the iput if it is proper email address or not
        value: validateEmailAddress(input));
  }

  //private constructor for password address
  const Password._({
    this.value,
  });
}



