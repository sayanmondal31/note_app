//for validate email
import 'package:dartz/dartz.dart';
import 'package:note_app_ddd/core/failures.dart';
import 'package:note_app_ddd/domain/auth/value_objects.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegExp =
      r"""^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$+""";

  if (RegExp(emailRegExp).hasMatch(input)) {
    // we are doing union using either so at right side we are using input function
    return right(input);
  } else {
    // for union purpose, for failure purpose we are using left.
    throw left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
 
// if password is less than 6 then it'll go for left else go for right
  if (input.length >= 6) {
    // we are doing union using either so at right side we are using input function
    return right(input);
  } else {
    // for union purpose, for failure purpose we are using left.
    throw left(ValueFailure.shortPassword(failedValue: input));
  }
}