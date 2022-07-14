// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'answer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnswerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) answerDescriptionChanged,
    required TResult Function(String questionId) postNewAnswer,
    required TResult Function(Answer answer) updateAnswer,
    required TResult Function(String questionId, String answerId) deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnswerDescriptionChanged value)
        answerDescriptionChanged,
    required TResult Function(PostNewAnswerPressed value) postNewAnswer,
    required TResult Function(UpdateAnswerPressed value) updateAnswer,
    required TResult Function(DeleteAnswerPressed value) deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerEventCopyWith<$Res> {
  factory $AnswerEventCopyWith(
          AnswerEvent value, $Res Function(AnswerEvent) then) =
      _$AnswerEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnswerEventCopyWithImpl<$Res> implements $AnswerEventCopyWith<$Res> {
  _$AnswerEventCopyWithImpl(this._value, this._then);

  final AnswerEvent _value;
  // ignore: unused_field
  final $Res Function(AnswerEvent) _then;
}

/// @nodoc
abstract class _$$AnswerDescriptionChangedCopyWith<$Res> {
  factory _$$AnswerDescriptionChangedCopyWith(_$AnswerDescriptionChanged value,
          $Res Function(_$AnswerDescriptionChanged) then) =
      __$$AnswerDescriptionChangedCopyWithImpl<$Res>;
  $Res call({String description});
}

/// @nodoc
class __$$AnswerDescriptionChangedCopyWithImpl<$Res>
    extends _$AnswerEventCopyWithImpl<$Res>
    implements _$$AnswerDescriptionChangedCopyWith<$Res> {
  __$$AnswerDescriptionChangedCopyWithImpl(_$AnswerDescriptionChanged _value,
      $Res Function(_$AnswerDescriptionChanged) _then)
      : super(_value, (v) => _then(v as _$AnswerDescriptionChanged));

  @override
  _$AnswerDescriptionChanged get _value =>
      super._value as _$AnswerDescriptionChanged;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_$AnswerDescriptionChanged(
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnswerDescriptionChanged
    with DiagnosticableTreeMixin
    implements AnswerDescriptionChanged {
  const _$AnswerDescriptionChanged(this.description);

  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerEvent.answerDescriptionChanged(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerEvent.answerDescriptionChanged'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerDescriptionChanged &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$AnswerDescriptionChangedCopyWith<_$AnswerDescriptionChanged>
      get copyWith =>
          __$$AnswerDescriptionChangedCopyWithImpl<_$AnswerDescriptionChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) answerDescriptionChanged,
    required TResult Function(String questionId) postNewAnswer,
    required TResult Function(Answer answer) updateAnswer,
    required TResult Function(String questionId, String answerId) deleteAnswer,
  }) {
    return answerDescriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
  }) {
    return answerDescriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (answerDescriptionChanged != null) {
      return answerDescriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnswerDescriptionChanged value)
        answerDescriptionChanged,
    required TResult Function(PostNewAnswerPressed value) postNewAnswer,
    required TResult Function(UpdateAnswerPressed value) updateAnswer,
    required TResult Function(DeleteAnswerPressed value) deleteAnswer,
  }) {
    return answerDescriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
  }) {
    return answerDescriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (answerDescriptionChanged != null) {
      return answerDescriptionChanged(this);
    }
    return orElse();
  }
}

abstract class AnswerDescriptionChanged implements AnswerEvent {
  const factory AnswerDescriptionChanged(final String description) =
      _$AnswerDescriptionChanged;

  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AnswerDescriptionChangedCopyWith<_$AnswerDescriptionChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostNewAnswerPressedCopyWith<$Res> {
  factory _$$PostNewAnswerPressedCopyWith(_$PostNewAnswerPressed value,
          $Res Function(_$PostNewAnswerPressed) then) =
      __$$PostNewAnswerPressedCopyWithImpl<$Res>;
  $Res call({String questionId});
}

/// @nodoc
class __$$PostNewAnswerPressedCopyWithImpl<$Res>
    extends _$AnswerEventCopyWithImpl<$Res>
    implements _$$PostNewAnswerPressedCopyWith<$Res> {
  __$$PostNewAnswerPressedCopyWithImpl(_$PostNewAnswerPressed _value,
      $Res Function(_$PostNewAnswerPressed) _then)
      : super(_value, (v) => _then(v as _$PostNewAnswerPressed));

  @override
  _$PostNewAnswerPressed get _value => super._value as _$PostNewAnswerPressed;

  @override
  $Res call({
    Object? questionId = freezed,
  }) {
    return _then(_$PostNewAnswerPressed(
      questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PostNewAnswerPressed
    with DiagnosticableTreeMixin
    implements PostNewAnswerPressed {
  const _$PostNewAnswerPressed(this.questionId);

  @override
  final String questionId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerEvent.postNewAnswer(questionId: $questionId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerEvent.postNewAnswer'))
      ..add(DiagnosticsProperty('questionId', questionId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostNewAnswerPressed &&
            const DeepCollectionEquality()
                .equals(other.questionId, questionId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(questionId));

  @JsonKey(ignore: true)
  @override
  _$$PostNewAnswerPressedCopyWith<_$PostNewAnswerPressed> get copyWith =>
      __$$PostNewAnswerPressedCopyWithImpl<_$PostNewAnswerPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) answerDescriptionChanged,
    required TResult Function(String questionId) postNewAnswer,
    required TResult Function(Answer answer) updateAnswer,
    required TResult Function(String questionId, String answerId) deleteAnswer,
  }) {
    return postNewAnswer(questionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
  }) {
    return postNewAnswer?.call(questionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (postNewAnswer != null) {
      return postNewAnswer(questionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnswerDescriptionChanged value)
        answerDescriptionChanged,
    required TResult Function(PostNewAnswerPressed value) postNewAnswer,
    required TResult Function(UpdateAnswerPressed value) updateAnswer,
    required TResult Function(DeleteAnswerPressed value) deleteAnswer,
  }) {
    return postNewAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
  }) {
    return postNewAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (postNewAnswer != null) {
      return postNewAnswer(this);
    }
    return orElse();
  }
}

abstract class PostNewAnswerPressed implements AnswerEvent {
  const factory PostNewAnswerPressed(final String questionId) =
      _$PostNewAnswerPressed;

  String get questionId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$PostNewAnswerPressedCopyWith<_$PostNewAnswerPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAnswerPressedCopyWith<$Res> {
  factory _$$UpdateAnswerPressedCopyWith(_$UpdateAnswerPressed value,
          $Res Function(_$UpdateAnswerPressed) then) =
      __$$UpdateAnswerPressedCopyWithImpl<$Res>;
  $Res call({Answer answer});
}

/// @nodoc
class __$$UpdateAnswerPressedCopyWithImpl<$Res>
    extends _$AnswerEventCopyWithImpl<$Res>
    implements _$$UpdateAnswerPressedCopyWith<$Res> {
  __$$UpdateAnswerPressedCopyWithImpl(
      _$UpdateAnswerPressed _value, $Res Function(_$UpdateAnswerPressed) _then)
      : super(_value, (v) => _then(v as _$UpdateAnswerPressed));

  @override
  _$UpdateAnswerPressed get _value => super._value as _$UpdateAnswerPressed;

  @override
  $Res call({
    Object? answer = freezed,
  }) {
    return _then(_$UpdateAnswerPressed(
      answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as Answer,
    ));
  }
}

/// @nodoc

class _$UpdateAnswerPressed
    with DiagnosticableTreeMixin
    implements UpdateAnswerPressed {
  const _$UpdateAnswerPressed(this.answer);

  @override
  final Answer answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerEvent.updateAnswer(answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerEvent.updateAnswer'))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAnswerPressed &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$UpdateAnswerPressedCopyWith<_$UpdateAnswerPressed> get copyWith =>
      __$$UpdateAnswerPressedCopyWithImpl<_$UpdateAnswerPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) answerDescriptionChanged,
    required TResult Function(String questionId) postNewAnswer,
    required TResult Function(Answer answer) updateAnswer,
    required TResult Function(String questionId, String answerId) deleteAnswer,
  }) {
    return updateAnswer(answer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
  }) {
    return updateAnswer?.call(answer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (updateAnswer != null) {
      return updateAnswer(answer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnswerDescriptionChanged value)
        answerDescriptionChanged,
    required TResult Function(PostNewAnswerPressed value) postNewAnswer,
    required TResult Function(UpdateAnswerPressed value) updateAnswer,
    required TResult Function(DeleteAnswerPressed value) deleteAnswer,
  }) {
    return updateAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
  }) {
    return updateAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (updateAnswer != null) {
      return updateAnswer(this);
    }
    return orElse();
  }
}

abstract class UpdateAnswerPressed implements AnswerEvent {
  const factory UpdateAnswerPressed(final Answer answer) =
      _$UpdateAnswerPressed;

  Answer get answer => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateAnswerPressedCopyWith<_$UpdateAnswerPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAnswerPressedCopyWith<$Res> {
  factory _$$DeleteAnswerPressedCopyWith(_$DeleteAnswerPressed value,
          $Res Function(_$DeleteAnswerPressed) then) =
      __$$DeleteAnswerPressedCopyWithImpl<$Res>;
  $Res call({String questionId, String answerId});
}

/// @nodoc
class __$$DeleteAnswerPressedCopyWithImpl<$Res>
    extends _$AnswerEventCopyWithImpl<$Res>
    implements _$$DeleteAnswerPressedCopyWith<$Res> {
  __$$DeleteAnswerPressedCopyWithImpl(
      _$DeleteAnswerPressed _value, $Res Function(_$DeleteAnswerPressed) _then)
      : super(_value, (v) => _then(v as _$DeleteAnswerPressed));

  @override
  _$DeleteAnswerPressed get _value => super._value as _$DeleteAnswerPressed;

  @override
  $Res call({
    Object? questionId = freezed,
    Object? answerId = freezed,
  }) {
    return _then(_$DeleteAnswerPressed(
      questionId: questionId == freezed
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      answerId: answerId == freezed
          ? _value.answerId
          : answerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteAnswerPressed
    with DiagnosticableTreeMixin
    implements DeleteAnswerPressed {
  const _$DeleteAnswerPressed(
      {required this.questionId, required this.answerId});

  @override
  final String questionId;
  @override
  final String answerId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerEvent.deleteAnswer(questionId: $questionId, answerId: $answerId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerEvent.deleteAnswer'))
      ..add(DiagnosticsProperty('questionId', questionId))
      ..add(DiagnosticsProperty('answerId', answerId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAnswerPressed &&
            const DeepCollectionEquality()
                .equals(other.questionId, questionId) &&
            const DeepCollectionEquality().equals(other.answerId, answerId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(questionId),
      const DeepCollectionEquality().hash(answerId));

  @JsonKey(ignore: true)
  @override
  _$$DeleteAnswerPressedCopyWith<_$DeleteAnswerPressed> get copyWith =>
      __$$DeleteAnswerPressedCopyWithImpl<_$DeleteAnswerPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) answerDescriptionChanged,
    required TResult Function(String questionId) postNewAnswer,
    required TResult Function(Answer answer) updateAnswer,
    required TResult Function(String questionId, String answerId) deleteAnswer,
  }) {
    return deleteAnswer(questionId, answerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
  }) {
    return deleteAnswer?.call(questionId, answerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? answerDescriptionChanged,
    TResult Function(String questionId)? postNewAnswer,
    TResult Function(Answer answer)? updateAnswer,
    TResult Function(String questionId, String answerId)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (deleteAnswer != null) {
      return deleteAnswer(questionId, answerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AnswerDescriptionChanged value)
        answerDescriptionChanged,
    required TResult Function(PostNewAnswerPressed value) postNewAnswer,
    required TResult Function(UpdateAnswerPressed value) updateAnswer,
    required TResult Function(DeleteAnswerPressed value) deleteAnswer,
  }) {
    return deleteAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
  }) {
    return deleteAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AnswerDescriptionChanged value)? answerDescriptionChanged,
    TResult Function(PostNewAnswerPressed value)? postNewAnswer,
    TResult Function(UpdateAnswerPressed value)? updateAnswer,
    TResult Function(DeleteAnswerPressed value)? deleteAnswer,
    required TResult orElse(),
  }) {
    if (deleteAnswer != null) {
      return deleteAnswer(this);
    }
    return orElse();
  }
}

abstract class DeleteAnswerPressed implements AnswerEvent {
  const factory DeleteAnswerPressed(
      {required final String questionId,
      required final String answerId}) = _$DeleteAnswerPressed;

  String get questionId => throw _privateConstructorUsedError;
  String get answerId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeleteAnswerPressedCopyWith<_$DeleteAnswerPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnswerState {
  QuestionDescription get description => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isAnswerSaveSuccess => throw _privateConstructorUsedError;
  bool get isAnswerUpdateSuccess => throw _privateConstructorUsedError;
  bool get isAnswerDeleteSuccess => throw _privateConstructorUsedError;
  Option<Either<AnswerFailure, Question>> get answerFailOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerStateCopyWith<AnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerStateCopyWith<$Res> {
  factory $AnswerStateCopyWith(
          AnswerState value, $Res Function(AnswerState) then) =
      _$AnswerStateCopyWithImpl<$Res>;
  $Res call(
      {QuestionDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      bool isAnswerSaveSuccess,
      bool isAnswerUpdateSuccess,
      bool isAnswerDeleteSuccess,
      Option<Either<AnswerFailure, Question>> answerFailOrSuccess});
}

/// @nodoc
class _$AnswerStateCopyWithImpl<$Res> implements $AnswerStateCopyWith<$Res> {
  _$AnswerStateCopyWithImpl(this._value, this._then);

  final AnswerState _value;
  // ignore: unused_field
  final $Res Function(AnswerState) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isAnswerSaveSuccess = freezed,
    Object? isAnswerUpdateSuccess = freezed,
    Object? isAnswerDeleteSuccess = freezed,
    Object? answerFailOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as QuestionDescription,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerSaveSuccess: isAnswerSaveSuccess == freezed
          ? _value.isAnswerSaveSuccess
          : isAnswerSaveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerUpdateSuccess: isAnswerUpdateSuccess == freezed
          ? _value.isAnswerUpdateSuccess
          : isAnswerUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerDeleteSuccess: isAnswerDeleteSuccess == freezed
          ? _value.isAnswerDeleteSuccess
          : isAnswerDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      answerFailOrSuccess: answerFailOrSuccess == freezed
          ? _value.answerFailOrSuccess
          : answerFailOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AnswerFailure, Question>>,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerStateCopyWith<$Res>
    implements $AnswerStateCopyWith<$Res> {
  factory _$$_AnswerStateCopyWith(
          _$_AnswerState value, $Res Function(_$_AnswerState) then) =
      __$$_AnswerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {QuestionDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      bool isAnswerSaveSuccess,
      bool isAnswerUpdateSuccess,
      bool isAnswerDeleteSuccess,
      Option<Either<AnswerFailure, Question>> answerFailOrSuccess});
}

/// @nodoc
class __$$_AnswerStateCopyWithImpl<$Res> extends _$AnswerStateCopyWithImpl<$Res>
    implements _$$_AnswerStateCopyWith<$Res> {
  __$$_AnswerStateCopyWithImpl(
      _$_AnswerState _value, $Res Function(_$_AnswerState) _then)
      : super(_value, (v) => _then(v as _$_AnswerState));

  @override
  _$_AnswerState get _value => super._value as _$_AnswerState;

  @override
  $Res call({
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isAnswerSaveSuccess = freezed,
    Object? isAnswerUpdateSuccess = freezed,
    Object? isAnswerDeleteSuccess = freezed,
    Object? answerFailOrSuccess = freezed,
  }) {
    return _then(_$_AnswerState(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as QuestionDescription,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerSaveSuccess: isAnswerSaveSuccess == freezed
          ? _value.isAnswerSaveSuccess
          : isAnswerSaveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerUpdateSuccess: isAnswerUpdateSuccess == freezed
          ? _value.isAnswerUpdateSuccess
          : isAnswerUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerDeleteSuccess: isAnswerDeleteSuccess == freezed
          ? _value.isAnswerDeleteSuccess
          : isAnswerDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      answerFailOrSuccess: answerFailOrSuccess == freezed
          ? _value.answerFailOrSuccess
          : answerFailOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AnswerFailure, Question>>,
    ));
  }
}

/// @nodoc

class _$_AnswerState with DiagnosticableTreeMixin implements _AnswerState {
  const _$_AnswerState(
      {required this.description,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.isAnswerSaveSuccess,
      required this.isAnswerUpdateSuccess,
      required this.isAnswerDeleteSuccess,
      required this.answerFailOrSuccess});

  @override
  final QuestionDescription description;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool isAnswerSaveSuccess;
  @override
  final bool isAnswerUpdateSuccess;
  @override
  final bool isAnswerDeleteSuccess;
  @override
  final Option<Either<AnswerFailure, Question>> answerFailOrSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AnswerState(description: $description, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isAnswerSaveSuccess: $isAnswerSaveSuccess, isAnswerUpdateSuccess: $isAnswerUpdateSuccess, isAnswerDeleteSuccess: $isAnswerDeleteSuccess, answerFailOrSuccess: $answerFailOrSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AnswerState'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isAnswerSaveSuccess', isAnswerSaveSuccess))
      ..add(DiagnosticsProperty('isAnswerUpdateSuccess', isAnswerUpdateSuccess))
      ..add(DiagnosticsProperty('isAnswerDeleteSuccess', isAnswerDeleteSuccess))
      ..add(DiagnosticsProperty('answerFailOrSuccess', answerFailOrSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerState &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isAnswerSaveSuccess, isAnswerSaveSuccess) &&
            const DeepCollectionEquality()
                .equals(other.isAnswerUpdateSuccess, isAnswerUpdateSuccess) &&
            const DeepCollectionEquality()
                .equals(other.isAnswerDeleteSuccess, isAnswerDeleteSuccess) &&
            const DeepCollectionEquality()
                .equals(other.answerFailOrSuccess, answerFailOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isAnswerSaveSuccess),
      const DeepCollectionEquality().hash(isAnswerUpdateSuccess),
      const DeepCollectionEquality().hash(isAnswerDeleteSuccess),
      const DeepCollectionEquality().hash(answerFailOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerStateCopyWith<_$_AnswerState> get copyWith =>
      __$$_AnswerStateCopyWithImpl<_$_AnswerState>(this, _$identity);
}

abstract class _AnswerState implements AnswerState {
  const factory _AnswerState(
      {required final QuestionDescription description,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final bool isAnswerSaveSuccess,
      required final bool isAnswerUpdateSuccess,
      required final bool isAnswerDeleteSuccess,
      required final Option<Either<AnswerFailure, Question>>
          answerFailOrSuccess}) = _$_AnswerState;

  @override
  QuestionDescription get description => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  bool get isAnswerSaveSuccess => throw _privateConstructorUsedError;
  @override
  bool get isAnswerUpdateSuccess => throw _privateConstructorUsedError;
  @override
  bool get isAnswerDeleteSuccess => throw _privateConstructorUsedError;
  @override
  Option<Either<AnswerFailure, Question>> get answerFailOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerStateCopyWith<_$_AnswerState> get copyWith =>
      throw _privateConstructorUsedError;
}
