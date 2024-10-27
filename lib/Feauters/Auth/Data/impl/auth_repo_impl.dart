import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/Core/Errors/exception.dart';
import 'package:fruits_app/Core/Errors/failure.dart';
import 'package:fruits_app/Core/Services/firebase_auth_services.dart';
import 'package:fruits_app/Feauters/Auth/Data/Models/user_models.dart';
import 'package:fruits_app/Feauters/Auth/Domin/Repos/auth_repo.dart';
import 'package:fruits_app/Feauters/Auth/Entity/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await fireBaseAuthService.createUserWithEmailAndPassword(
          password: password, email: email);
      return right(
        UserModel.fromFirebase(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()} ',
      );
      return left(
        ServerFailure(
          'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await fireBaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(
        UserModel.fromFirebase(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()} ',
      );
      return left(
        ServerFailure(
          'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await fireBaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebase(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()} ',
      );
      return left(
        ServerFailure(
          'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await fireBaseAuthService.signInWithFacebook();
      return right(
        UserModel.fromFirebase(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()} ',
      );
      return left(
        ServerFailure(
          'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await fireBaseAuthService.signInWithApple();
      return right(
        UserModel.fromFirebase(user),
      );
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithApple: ${e.toString()} ',
      );
      return left(
        ServerFailure(
          'هناك خطأ ما , الرجاء المحاولة مرة اخرى',
        ),
      );
    }
  }
}
