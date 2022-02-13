import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  // ignore: unused_field
  String _verificationId = '';
  // ignore: unused_field
  int? _resendToken;

  void verifyPhone(String phoneNumber) {
    _auth.verifyPhoneNumber(
      phoneNumber: '+91 $phoneNumber',
      timeout: const Duration(seconds: 120),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  _verificationCompleted(AuthCredential credential) async {
    try {
      await _auth.signInWithCredential(credential);
      Get.snackbar('Success', 'Verification completed');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  _verificationFailed(FirebaseAuthException e) {
    Get.snackbar('Error', e.message ?? 'Verification failed');
  }

  _codeSent(String verificationId, int? resendToken) {
    _verificationId = verificationId;
    _resendToken = resendToken;
    Get.snackbar('Code Received', 'Code sent to your phone as SMS');
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    _verificationId = verificationId;
  }

  void verifyCode(String smsCode) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);
      Get.back();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Verification failed');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
