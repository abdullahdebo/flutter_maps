// ignore_for_file: depend_on_referenced_packages, unnecessary_this

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  late String verificationId;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+966$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: (String verificationId, int? resendToken) {
        print('codeSent');
        this.verificationId = verificationId;
        emit(PhoneNumberSubmited());
      },
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccured(errorMsg: error.toString()));
  }

  // void codeSent(String verificationId, Int? resendToken) {
  //   print('codeSent');
  //   this.verificationId = verificationId;
  //   emit(PhoneNumberSubmited());
  // }

  void codeAutoRetrievalTimeout(String verficationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> subMitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: this.verificationId,
      smsCode: otpCode,
    );
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then((val) {
        print(credential.accessToken);
      });
      emit(PhoneOtpVerified());
    } catch (error) {
      emit(ErrorOccured(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    print(FirebaseAuth.instance.currentUser?.uid.toString());
    User firebaseUSer = FirebaseAuth.instance.currentUser!;
    return firebaseUSer;
  }
}
