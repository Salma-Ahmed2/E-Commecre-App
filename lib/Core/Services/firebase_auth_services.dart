import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/Core/Errors/exception.dart';

class FireBaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'هذا الرقم السري ضعيف جدا',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لديك حساب بالفعل في هذا البريد الالكتروني',
        );
      } else {
        throw CustomException(
            message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى');
      }
    } catch (e) {
      throw CustomException(
        message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }
}
