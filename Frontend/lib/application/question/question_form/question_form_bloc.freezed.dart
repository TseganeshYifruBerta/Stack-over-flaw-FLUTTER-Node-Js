// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFormEventCopyWith<$Res> {
  factory $QuestionFormEventCopyWith(
          QuestionFormEvent value, $Res Function(QuestionFormEvent) then) =
      _$QuestionFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuestionFormEventCopyWithImpl<$Res>
    implements $QuestionFormEventCopyWith<$Res> {
  _$QuestionFormEventCopyWithImpl(this._value, this._then);

  final QuestionFormEvent _value;
  // ignore: unused_field
  final $Res Function(QuestionFormEvent) _then;
}

/// @nodoc
abstract class _$$TitleChangedCopyWith<$Res> {
  factory _$$TitleChangedCopyWith(
          _$TitleChanged value, $Res Function(_$TitleChanged) then) =
      __$$TitleChangedCopyWithImpl<$Res>;
  $Res call({String title});
}

/// @nodoc
class __$$TitleChangedCopyWithImpl<$Res>
    extends _$QuestionFormEventCopyWithImpl<$Res>
    implements _$$TitleChangedCopyWith<$Res> {
  __$$TitleChangedCopyWithImpl(
      _$TitleChanged _value, $Res Function(_$TitleChanged) _then)
      : super(_value, (v) => _then(v as _$TitleChanged));

  @override
  _$TitleChanged get _value => super._value as _$TitleChanged;

  @override
  $Res call({
    Object? title = freezed,
  }) {
    return _then(_$TitleChanged(
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TitleChanged with DiagnosticableTreeMixin implements TitleChanged {
  const _$TitleChanged(this.title);

  @override
  final String title;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormEvent.titleChanged(title: $title)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionFormEvent.titleChanged'))
      ..add(DiagnosticsProperty('title', title));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TitleChanged &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$TitleChangedCopyWith<_$TitleChanged> get copyWith =>
      __$$TitleChangedCopyWithImpl<_$TitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) {
    return titleChanged(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) {
    return titleChanged?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) {
    return titleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) {
    return titleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (titleChanged != null) {
      return titleChanged(this);
    }
    return orElse();
  }
}

abstract class TitleChanged implements QuestionFormEvent {
  const factory TitleChanged(final String title) = _$TitleChanged;

  String get title => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$TitleChangedCopyWith<_$TitleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DescriptionChangedCopyWith<$Res> {
  factory _$$DescriptionChangedCopyWith(_$DescriptionChanged value,
          $Res Function(_$DescriptionChanged) then) =
      __$$DescriptionChangedCopyWithImpl<$Res>;
  $Res call({String description});
}

/// @nodoc
class __$$DescriptionChangedCopyWithImpl<$Res>
    extends _$QuestionFormEventCopyWithImpl<$Res>
    implements _$$DescriptionChangedCopyWith<$Res> {
  __$$DescriptionChangedCopyWithImpl(
      _$DescriptionChanged _value, $Res Function(_$DescriptionChanged) _then)
      : super(_value, (v) => _then(v as _$DescriptionChanged));

  @override
  _$DescriptionChanged get _value => super._value as _$DescriptionChanged;

  @override
  $Res call({
    Object? description = freezed,
  }) {
    return _then(_$DescriptionChanged(
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DescriptionChanged
    with DiagnosticableTreeMixin
    implements DescriptionChanged {
  const _$DescriptionChanged(this.description);

  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormEvent.descriptionChanged(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionFormEvent.descriptionChanged'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptionChanged &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$DescriptionChangedCopyWith<_$DescriptionChanged> get copyWith =>
      __$$DescriptionChangedCopyWithImpl<_$DescriptionChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) {
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) {
    return descriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) {
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) {
    return descriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class DescriptionChanged implements QuestionFormEvent {
  const factory DescriptionChanged(final String description) =
      _$DescriptionChanged;

  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DescriptionChangedCopyWith<_$DescriptionChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostNewQuestionPressedCopyWith<$Res> {
  factory _$$PostNewQuestionPressedCopyWith(_$PostNewQuestionPressed value,
          $Res Function(_$PostNewQuestionPressed) then) =
      __$$PostNewQuestionPressedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostNewQuestionPressedCopyWithImpl<$Res>
    extends _$QuestionFormEventCopyWithImpl<$Res>
    implements _$$PostNewQuestionPressedCopyWith<$Res> {
  __$$PostNewQuestionPressedCopyWithImpl(_$PostNewQuestionPressed _value,
      $Res Function(_$PostNewQuestionPressed) _then)
      : super(_value, (v) => _then(v as _$PostNewQuestionPressed));

  @override
  _$PostNewQuestionPressed get _value =>
      super._value as _$PostNewQuestionPressed;
}

/// @nodoc

class _$PostNewQuestionPressed
    with DiagnosticableTreeMixin
    implements PostNewQuestionPressed {
  const _$PostNewQuestionPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormEvent.postNewQuestion()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'QuestionFormEvent.postNewQuestion'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostNewQuestionPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) {
    return postNewQuestion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) {
    return postNewQuestion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (postNewQuestion != null) {
      return postNewQuestion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) {
    return postNewQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) {
    return postNewQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (postNewQuestion != null) {
      return postNewQuestion(this);
    }
    return orElse();
  }
}

abstract class PostNewQuestionPressed implements QuestionFormEvent {
  const factory PostNewQuestionPressed() = _$PostNewQuestionPressed;
}

/// @nodoc
abstract class _$$UpdateQuestionPressedCopyWith<$Res> {
  factory _$$UpdateQuestionPressedCopyWith(_$UpdateQuestionPressed value,
          $Res Function(_$UpdateQuestionPressed) then) =
      __$$UpdateQuestionPressedCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$UpdateQuestionPressedCopyWithImpl<$Res>
    extends _$QuestionFormEventCopyWithImpl<$Res>
    implements _$$UpdateQuestionPressedCopyWith<$Res> {
  __$$UpdateQuestionPressedCopyWithImpl(_$UpdateQuestionPressed _value,
      $Res Function(_$UpdateQuestionPressed) _then)
      : super(_value, (v) => _then(v as _$UpdateQuestionPressed));

  @override
  _$UpdateQuestionPressed get _value => super._value as _$UpdateQuestionPressed;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$UpdateQuestionPressed(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateQuestionPressed
    with DiagnosticableTreeMixin
    implements UpdateQuestionPressed {
  const _$UpdateQuestionPressed(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormEvent.updateQuestion(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionFormEvent.updateQuestion'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuestionPressed &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$UpdateQuestionPressedCopyWith<_$UpdateQuestionPressed> get copyWith =>
      __$$UpdateQuestionPressedCopyWithImpl<_$UpdateQuestionPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) {
    return updateQuestion(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) {
    return updateQuestion?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (updateQuestion != null) {
      return updateQuestion(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) {
    return updateQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) {
    return updateQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (updateQuestion != null) {
      return updateQuestion(this);
    }
    return orElse();
  }
}

abstract class UpdateQuestionPressed implements QuestionFormEvent {
  const factory UpdateQuestionPressed(final String id) =
      _$UpdateQuestionPressed;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$UpdateQuestionPressedCopyWith<_$UpdateQuestionPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteQuestionPressedCopyWith<$Res> {
  factory _$$DeleteQuestionPressedCopyWith(_$DeleteQuestionPressed value,
          $Res Function(_$DeleteQuestionPressed) then) =
      __$$DeleteQuestionPressedCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$DeleteQuestionPressedCopyWithImpl<$Res>
    extends _$QuestionFormEventCopyWithImpl<$Res>
    implements _$$DeleteQuestionPressedCopyWith<$Res> {
  __$$DeleteQuestionPressedCopyWithImpl(_$DeleteQuestionPressed _value,
      $Res Function(_$DeleteQuestionPressed) _then)
      : super(_value, (v) => _then(v as _$DeleteQuestionPressed));

  @override
  _$DeleteQuestionPressed get _value => super._value as _$DeleteQuestionPressed;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$DeleteQuestionPressed(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteQuestionPressed
    with DiagnosticableTreeMixin
    implements DeleteQuestionPressed {
  const _$DeleteQuestionPressed(this.id);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormEvent.deleteQuestion(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionFormEvent.deleteQuestion'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteQuestionPressed &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$DeleteQuestionPressedCopyWith<_$DeleteQuestionPressed> get copyWith =>
      __$$DeleteQuestionPressedCopyWithImpl<_$DeleteQuestionPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) titleChanged,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() postNewQuestion,
    required TResult Function(String id) updateQuestion,
    required TResult Function(String id) deleteQuestion,
  }) {
    return deleteQuestion(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
  }) {
    return deleteQuestion?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? titleChanged,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? postNewQuestion,
    TResult Function(String id)? updateQuestion,
    TResult Function(String id)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (deleteQuestion != null) {
      return deleteQuestion(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TitleChanged value) titleChanged,
    required TResult Function(DescriptionChanged value) descriptionChanged,
    required TResult Function(PostNewQuestionPressed value) postNewQuestion,
    required TResult Function(UpdateQuestionPressed value) updateQuestion,
    required TResult Function(DeleteQuestionPressed value) deleteQuestion,
  }) {
    return deleteQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
  }) {
    return deleteQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TitleChanged value)? titleChanged,
    TResult Function(DescriptionChanged value)? descriptionChanged,
    TResult Function(PostNewQuestionPressed value)? postNewQuestion,
    TResult Function(UpdateQuestionPressed value)? updateQuestion,
    TResult Function(DeleteQuestionPressed value)? deleteQuestion,
    required TResult orElse(),
  }) {
    if (deleteQuestion != null) {
      return deleteQuestion(this);
    }
    return orElse();
  }
}

abstract class DeleteQuestionPressed implements QuestionFormEvent {
  const factory DeleteQuestionPressed(final String id) =
      _$DeleteQuestionPressed;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$DeleteQuestionPressedCopyWith<_$DeleteQuestionPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QuestionFormState {
  QuestionTitle get title => throw _privateConstructorUsedError;
  QuestionDescription get description => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isQuestionSaveSuccess => throw _privateConstructorUsedError;
  bool get isQuestionDeleteSuccess => throw _privateConstructorUsedError;
  Option<Either<QuestionFailure, Question>> get questionFailOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionFormStateCopyWith<QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionFormStateCopyWith<$Res> {
  factory $QuestionFormStateCopyWith(
          QuestionFormState value, $Res Function(QuestionFormState) then) =
      _$QuestionFormStateCopyWithImpl<$Res>;
  $Res call(
      {QuestionTitle title,
      QuestionDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      bool isQuestionSaveSuccess,
      bool isQuestionDeleteSuccess,
      Option<Either<QuestionFailure, Question>> questionFailOrSuccess});
}

/// @nodoc
class _$QuestionFormStateCopyWithImpl<$Res>
    implements $QuestionFormStateCopyWith<$Res> {
  _$QuestionFormStateCopyWithImpl(this._value, this._then);

  final QuestionFormState _value;
  // ignore: unused_field
  final $Res Function(QuestionFormState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isQuestionSaveSuccess = freezed,
    Object? isQuestionDeleteSuccess = freezed,
    Object? questionFailOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as QuestionTitle,
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
      isQuestionSaveSuccess: isQuestionSaveSuccess == freezed
          ? _value.isQuestionSaveSuccess
          : isQuestionSaveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuestionDeleteSuccess: isQuestionDeleteSuccess == freezed
          ? _value.isQuestionDeleteSuccess
          : isQuestionDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      questionFailOrSuccess: questionFailOrSuccess == freezed
          ? _value.questionFailOrSuccess
          : questionFailOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<QuestionFailure, Question>>,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionFormStateCopyWith<$Res>
    implements $QuestionFormStateCopyWith<$Res> {
  factory _$$_QuestionFormStateCopyWith(_$_QuestionFormState value,
          $Res Function(_$_QuestionFormState) then) =
      __$$_QuestionFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {QuestionTitle title,
      QuestionDescription description,
      bool showErrorMessages,
      bool isSubmitting,
      bool isQuestionSaveSuccess,
      bool isQuestionDeleteSuccess,
      Option<Either<QuestionFailure, Question>> questionFailOrSuccess});
}

/// @nodoc
class __$$_QuestionFormStateCopyWithImpl<$Res>
    extends _$QuestionFormStateCopyWithImpl<$Res>
    implements _$$_QuestionFormStateCopyWith<$Res> {
  __$$_QuestionFormStateCopyWithImpl(
      _$_QuestionFormState _value, $Res Function(_$_QuestionFormState) _then)
      : super(_value, (v) => _then(v as _$_QuestionFormState));

  @override
  _$_QuestionFormState get _value => super._value as _$_QuestionFormState;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? isQuestionSaveSuccess = freezed,
    Object? isQuestionDeleteSuccess = freezed,
    Object? questionFailOrSuccess = freezed,
  }) {
    return _then(_$_QuestionFormState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as QuestionTitle,
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
      isQuestionSaveSuccess: isQuestionSaveSuccess == freezed
          ? _value.isQuestionSaveSuccess
          : isQuestionSaveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuestionDeleteSuccess: isQuestionDeleteSuccess == freezed
          ? _value.isQuestionDeleteSuccess
          : isQuestionDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      questionFailOrSuccess: questionFailOrSuccess == freezed
          ? _value.questionFailOrSuccess
          : questionFailOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<QuestionFailure, Question>>,
    ));
  }
}

/// @nodoc

class _$_QuestionFormState
    with DiagnosticableTreeMixin
    implements _QuestionFormState {
  const _$_QuestionFormState(
      {required this.title,
      required this.description,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.isQuestionSaveSuccess,
      required this.isQuestionDeleteSuccess,
      required this.questionFailOrSuccess});

  @override
  final QuestionTitle title;
  @override
  final QuestionDescription description;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final bool isQuestionSaveSuccess;
  @override
  final bool isQuestionDeleteSuccess;
  @override
  final Option<Either<QuestionFailure, Question>> questionFailOrSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionFormState(title: $title, description: $description, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, isQuestionSaveSuccess: $isQuestionSaveSuccess, isQuestionDeleteSuccess: $isQuestionDeleteSuccess, questionFailOrSuccess: $questionFailOrSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionFormState'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isQuestionSaveSuccess', isQuestionSaveSuccess))
      ..add(DiagnosticsProperty(
          'isQuestionDeleteSuccess', isQuestionDeleteSuccess))
      ..add(
          DiagnosticsProperty('questionFailOrSuccess', questionFailOrSuccess));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionFormState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isQuestionSaveSuccess, isQuestionSaveSuccess) &&
            const DeepCollectionEquality().equals(
                other.isQuestionDeleteSuccess, isQuestionDeleteSuccess) &&
            const DeepCollectionEquality()
                .equals(other.questionFailOrSuccess, questionFailOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isQuestionSaveSuccess),
      const DeepCollectionEquality().hash(isQuestionDeleteSuccess),
      const DeepCollectionEquality().hash(questionFailOrSuccess));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      __$$_QuestionFormStateCopyWithImpl<_$_QuestionFormState>(
          this, _$identity);
}

abstract class _QuestionFormState implements QuestionFormState {
  const factory _QuestionFormState(
      {required final QuestionTitle title,
      required final QuestionDescription description,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final bool isQuestionSaveSuccess,
      required final bool isQuestionDeleteSuccess,
      required final Option<Either<QuestionFailure, Question>>
          questionFailOrSuccess}) = _$_QuestionFormState;

  @override
  QuestionTitle get title => throw _privateConstructorUsedError;
  @override
  QuestionDescription get description => throw _privateConstructorUsedError;
  @override
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  bool get isQuestionSaveSuccess => throw _privateConstructorUsedError;
  @override
  bool get isQuestionDeleteSuccess => throw _privateConstructorUsedError;
  @override
  Option<Either<QuestionFailure, Question>> get questionFailOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionFormStateCopyWith<_$_QuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
