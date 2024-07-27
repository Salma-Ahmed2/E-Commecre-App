import 'package:fruits_app/Core/Services/firebase_auth_services.dart';
import 'package:fruits_app/Feauters/Auth/Data/impl/auth_repo_impl.dart';
import 'package:fruits_app/Feauters/Auth/Domin/Repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FireBaseAuthService>(FireBaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      fireBaseAuthService: getIt<FireBaseAuthService>(),
    ),
  );
}
