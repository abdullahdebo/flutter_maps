part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

class Loading extends PhoneAuthState {}

class ErrorOccured extends PhoneAuthState {
  final String errorMsg;

  ErrorOccured({required this.errorMsg});
}

class PhoneNumberSubmited extends PhoneAuthState {}

class PhoneOtpVerified extends PhoneAuthState {}
