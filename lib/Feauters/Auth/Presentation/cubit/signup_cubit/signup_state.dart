part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  final String message;
  SignupSuccess({required this.userEntity, required this.message});
}

final class SignupFailuer extends SignupState {
  final String message;

  SignupFailuer({required this.message});
}
