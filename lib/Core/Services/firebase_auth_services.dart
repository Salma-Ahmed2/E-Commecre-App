import 'dart:developer';

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
      log('Exception in Fire Base Auth Service.createUserWithEmailAndPassword : ${e.toString()} And Code Is ${e.code}');

      if (e.code == 'weak-password') {
        throw CustomException(
          message: 'هذا الرقم السري ضعيف جدا',
        );
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message:
              'هذا البريد الالكتروني مستخدم مسبقاً , الرجاء إدخال بريد الكتروني اخر',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من اتصالك من الإنترنت , حاول مرة أخرى');
      } else {
        throw CustomException(
            message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.createUserWithEmailAndPassword : ${e.toString()}');
      throw CustomException(
        message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }
}
