import 'package:bloc/bloc.dart';
import 'package:fruits_app/Feauters/Auth/Domin/Repos/auth_repo.dart';
import 'package:fruits_app/Feauters/Auth/Entity/user_entity.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(
      SignupLoading(),
    );
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignupFailuer(message: failure.message)),
      (userEntity) => emit(
        SignupSuccess(message: 'تم التسجيل بنجاح', userEntity: userEntity),
      ),
    );
  }
}
