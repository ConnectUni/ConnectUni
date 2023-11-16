// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  set displayName(String value) => throw _privateConstructorUsedError;
  String get pfp => throw _privateConstructorUsedError;
  set pfp(String value) => throw _privateConstructorUsedError;
  String get major => throw _privateConstructorUsedError;
  set major(String value) => throw _privateConstructorUsedError;
  String get projectedGraduation => throw _privateConstructorUsedError;
  set projectedGraduation(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  List<User> get friends => throw _privateConstructorUsedError;
  set friends(List<User> value) => throw _privateConstructorUsedError;
  List<String> get groupIDs => throw _privateConstructorUsedError;
  set groupIDs(List<String> value) => throw _privateConstructorUsedError;
  List<String> get eventIDs => throw _privateConstructorUsedError;
  set eventIDs(List<String> value) => throw _privateConstructorUsedError;
  List<String> get interests => throw _privateConstructorUsedError;
  set interests(List<String> value) => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  set password(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String pfp,
      String major,
      String projectedGraduation,
      String status,
      List<User> friends,
      List<String> groupIDs,
      List<String> eventIDs,
      List<String> interests,
      String password});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? pfp = null,
    Object? major = null,
    Object? projectedGraduation = null,
    Object? status = null,
    Object? friends = null,
    Object? groupIDs = null,
    Object? eventIDs = null,
    Object? interests = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      pfp: null == pfp
          ? _value.pfp
          : pfp // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      projectedGraduation: null == projectedGraduation
          ? _value.projectedGraduation
          : projectedGraduation // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<User>,
      groupIDs: null == groupIDs
          ? _value.groupIDs
          : groupIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventIDs: null == eventIDs
          ? _value.eventIDs
          : eventIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String pfp,
      String major,
      String projectedGraduation,
      String status,
      List<User> friends,
      List<String> groupIDs,
      List<String> eventIDs,
      List<String> interests,
      String password});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? pfp = null,
    Object? major = null,
    Object? projectedGraduation = null,
    Object? status = null,
    Object? friends = null,
    Object? groupIDs = null,
    Object? eventIDs = null,
    Object? interests = null,
    Object? password = null,
  }) {
    return _then(_$UserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      pfp: null == pfp
          ? _value.pfp
          : pfp // ignore: cast_nullable_to_non_nullable
              as String,
      major: null == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String,
      projectedGraduation: null == projectedGraduation
          ? _value.projectedGraduation
          : projectedGraduation // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<User>,
      groupIDs: null == groupIDs
          ? _value.groupIDs
          : groupIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventIDs: null == eventIDs
          ? _value.eventIDs
          : eventIDs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  _$UserImpl(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.pfp,
      required this.major,
      required this.projectedGraduation,
      required this.status,
      required this.friends,
      required this.groupIDs,
      required this.eventIDs,
      required this.interests,
      required this.password});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  String displayName;
  @override
  String pfp;
  @override
  String major;
  @override
  String projectedGraduation;
  @override
  String status;
  @override
  List<User> friends;
  @override
  List<String> groupIDs;
  @override
  List<String> eventIDs;
  @override
  List<String> interests;
  @override
  String password;

  @override
  String toString() {
    return 'User(uid: $uid, email: $email, displayName: $displayName, pfp: $pfp, major: $major, projectedGraduation: $projectedGraduation, status: $status, friends: $friends, groupIDs: $groupIDs, eventIDs: $eventIDs, interests: $interests, password: $password)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {required final String uid,
      required final String email,
      required String displayName,
      required String pfp,
      required String major,
      required String projectedGraduation,
      required String status,
      required List<User> friends,
      required List<String> groupIDs,
      required List<String> eventIDs,
      required List<String> interests,
      required String password}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  set displayName(String value);
  @override
  String get pfp;
  set pfp(String value);
  @override
  String get major;
  set major(String value);
  @override
  String get projectedGraduation;
  set projectedGraduation(String value);
  @override
  String get status;
  set status(String value);
  @override
  List<User> get friends;
  set friends(List<User> value);
  @override
  List<String> get groupIDs;
  set groupIDs(List<String> value);
  @override
  List<String> get eventIDs;
  set eventIDs(List<String> value);
  @override
  List<String> get interests;
  set interests(List<String> value);
  @override
  String get password;
  set password(String value);
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
