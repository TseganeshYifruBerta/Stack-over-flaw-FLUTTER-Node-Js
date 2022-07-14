import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class QuestionTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory QuestionTitle(String input) {
    assert(input != null);
    return QuestionTitle._(
      validateTitle(input),
    );
  }

  const QuestionTitle._(this.value);
}

class QuestionDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory QuestionDescription(String input) {
    assert(input != null);
    return QuestionDescription._(
      validateDescription(input),
    );
  }

  const QuestionDescription._(this.value);
}
