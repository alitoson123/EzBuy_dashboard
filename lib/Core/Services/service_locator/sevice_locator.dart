import 'package:e_commerce_app/Core/Services/ARUD_user/ARUD_user.dart';
import 'package:e_commerce_app/Core/Services/firebase_auth_service/firebase_auth_service.dart';
import 'package:e_commerce_app/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(authObject: Auth(), arudUserObject: ArudUser()),
  );
}
