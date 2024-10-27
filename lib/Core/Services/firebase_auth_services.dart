import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/Core/Errors/exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      } else if (e.code == 'invalid-email') {
        throw CustomException(
            message: 'البريد الالكتروني غير صالح  , حاول مرة أخرى');
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

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in Fire Base Auth Service.signInWithEmailAndPassword : ${e.toString()} And Code Is ${e.code}');
      if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'البريد الالكتروني او كلمة السر خاطئة',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من اتصالك من الإنترنت , حاول مرة أخرى');
      } else if (e.code == 'too-many-requests') {
        throw CustomException(
            message:
                'لقد تجاوزت الحد الأقصى من الطلبات , الرجاء المحاولة مرة أخرى في وقت لاحق');
      } else {
        throw CustomException(
            message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى');
      }
    } catch (e) {
      log('Exception in FireBaseAuthService.signInWithEmailAndPassword : ${e.toString()}');
      throw CustomException(
        message: 'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
  }
}
