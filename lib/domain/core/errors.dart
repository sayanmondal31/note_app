import 'package:note_app_ddd/domain/core/failures.dart';

class UnexpectedValueErrr extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueErrr(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure at an unrecoverable point, terminating';

    return Error.safeToString('$explanation Failure was: $valueFailure'); 
  }
}
