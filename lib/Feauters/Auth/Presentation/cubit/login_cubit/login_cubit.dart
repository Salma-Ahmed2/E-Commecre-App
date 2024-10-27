import 'package:bloc/bloc.dart';
import 'package:fruits_app/Feauters/Auth/Domin/Repos/auth_repo.dart';
import 'package:fruits_app/Feauters/Auth/Entity/user_entity.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  Future<void> logIn(String email, String password) async {
    emit(
      LoginLoading(),
    );
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailuer(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(message: 'تم التسجيل بنجاح', userEntity: userEntity),
      ),
    );
  }

  Future<void> logInWithGoogle() async {
    emit(
      LoginLoading(),
    );
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailuer(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(message: 'تم التسجيل بنجاح', userEntity: userEntity),
      ),
    );
  }

  Future<void> logInWithFacebook() async {
    emit(
      LoginLoading(),
    );
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailuer(message: failure.message)),
      (userEntity) => emit(
        LoginSuccess(message: 'تم التسجيل بنجاح', userEntity: userEntity),
      ),
    );
  }
}
