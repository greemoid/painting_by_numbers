// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:paiting_by_numbers/app/app_flow/app_flow_cubit.dart' as _i161;
import 'package:paiting_by_numbers/app/app_flow/session/session_cubit.dart'
    as _i197;
import 'package:paiting_by_numbers/app/app_flow/session/session_initializer.dart'
    as _i909;
import 'package:paiting_by_numbers/app/app_flow/session/session_manager_impl.dart'
    as _i143;
import 'package:paiting_by_numbers/app/app_flow/session/token_storage_impl.dart'
    as _i223;
import 'package:paiting_by_numbers/app/cubits/theme_cubit.dart' as _i802;
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart'
    as _i685;
import 'package:paiting_by_numbers/core/app_flow/session/token_storage.dart'
    as _i906;
import 'package:paiting_by_numbers/core/di/firebase_module.dart' as _i83;
import 'package:paiting_by_numbers/core/di/modules/app_module.dart' as _i787;
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart'
    as _i519;
import 'package:paiting_by_numbers/features/auth/navigation/data/repository/auth_repository_impl.dart'
    as _i602;
import 'package:paiting_by_numbers/features/auth/navigation/data/services/auth_service.dart'
    as _i664;
import 'package:paiting_by_numbers/features/auth/navigation/data/services/firebase_auth_service.dart'
    as _i46;
import 'package:paiting_by_numbers/features/auth/navigation/domain/repository/auth_repository.dart'
    as _i729;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/get_current_user_use_case.dart'
    as _i321;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/log_out_use_case.dart'
    as _i675;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/send_password_reset_link_use_case.dart'
    as _i602;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_in_with_email_use_case.dart'
    as _i1064;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_in_with_google_use_case.dart'
    as _i721;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/sign_up_with_email_use_case.dart'
    as _i443;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/watch_auth_state_use_case.dart'
    as _i750;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final appModule = _$AppModule();
    gh.lazySingleton<_i197.SessionCubit>(() => _i197.SessionCubit());
    gh.lazySingleton<_i802.ThemeCubit>(() => _i802.ThemeCubit());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i519.FailureNotifier>(() => _i519.FailureNotifier());
    gh.lazySingleton<_i161.AppFlowCubit>(
      () => _i161.AppFlowCubit(gh<_i197.SessionCubit>()),
    );
    gh.lazySingleton<_i906.TokenStorage>(
      () => _i223.TokenStorageImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i685.SessionManager>(
      () => _i143.SessionManagerImpl(
        gh<_i197.SessionCubit>(),
        gh<_i906.TokenStorage>(),
      ),
    );
    gh.lazySingleton<_i909.SessionInitializer>(
      () => _i909.SessionInitializer(gh<_i685.SessionManager>()),
    );
    gh.lazySingleton<_i664.AuthService>(
      () => _i46.FirebaseAuthService(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i729.AuthRepository>(
      () => _i602.AuthRepositoryImpl(gh<_i664.AuthService>()),
    );
    gh.factory<_i675.LogOutUseCase>(
      () => _i675.LogOutUseCase(
        gh<_i729.AuthRepository>(),
        gh<_i685.SessionManager>(),
      ),
    );
    gh.factory<_i321.GetCurrentUserUseCase>(
      () => _i321.GetCurrentUserUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i602.SendPasswordResetLinkUseCase>(
      () => _i602.SendPasswordResetLinkUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i1064.SignInWithEmailUseCase>(
      () => _i1064.SignInWithEmailUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i721.SignInWithGoogleUseCase>(
      () => _i721.SignInWithGoogleUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i443.SignUpWithEmailUseCase>(
      () => _i443.SignUpWithEmailUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i750.WatchAuthStateUseCase>(
      () => _i750.WatchAuthStateUseCase(gh<_i729.AuthRepository>()),
    );
    return this;
  }
}

class _$FirebaseModule extends _i83.FirebaseModule {}

class _$AppModule extends _i787.AppModule {}
