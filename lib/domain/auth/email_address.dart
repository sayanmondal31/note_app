import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';
 
class EmailAddress {
  final String value;
  // //either is union of two values , left is for falure and rifgt is for success or true value 
  // final Either<Left, Right> falure;


  factory EmailAddress(String input) {
    //input not be null
    assert(input != null);

    return EmailAddress._(
      //get email from user and validate the iput if it is proper email address or not 
      value: validateEmailAddress(input)
      
    );
  }

  //private constructor for email address
  const EmailAddress._({
    this.value,
  });

  @override
  String toString() => 'Email(value: $value)';

//checking identical or not and returns true or false value
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EmailAddress && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

//for validate email 
String validateEmailAddress(String input) {
  const emailRegExp =
      r"""^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$+""";

  if (RegExp(emailRegExp).hasMatch(input)) {
    return input;
  } else {
    throw InvalidEmailFailure(failedValue: input);
  }
}

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T>{
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;
}

// if email has any exception , created InvalidEmailException class 
class InvalidEmailFailure  {
  final String failedValue;

  InvalidEmailFailure({this.failedValue});
}
