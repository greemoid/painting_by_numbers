// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:paiting_by_numbers/app/app_flow/app_flow_cubit.dart' as _i161;
import 'package:paiting_by_numbers/app/app_flow/session/session_cubit.dart'
    as _i197;
import 'package:paiting_by_numbers/app/app_flow/session/session_initializer.dart'
    as _i909;
import 'package:paiting_by_numbers/app/app_flow/session/session_manager_impl.dart'
    as _i143;
import 'package:paiting_by_numbers/app/ui/theme/state/theme_cubit.dart'
    as _i747;
import 'package:paiting_by_numbers/core/app_flow/session/session_manager.dart'
    as _i685;
import 'package:paiting_by_numbers/core/config/env_config.dart' as _i711;
import 'package:paiting_by_numbers/core/di/api_module.dart' as _i276;
import 'package:paiting_by_numbers/core/di/firebase_module.dart' as _i83;
import 'package:paiting_by_numbers/core/di/modules/app_module.dart' as _i787;
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart'
    as _i519;
import 'package:paiting_by_numbers/core/services/file_picker/file_picker_service.dart'
    as _i954;
import 'package:paiting_by_numbers/core/services/file_picker/file_picker_service_impl.dart'
    as _i351;
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
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/reload_user_use_case.dart'
    as _i170;
import 'package:paiting_by_numbers/features/auth/navigation/domain/use_cases/send_email_verification_use_case.dart'
    as _i260;
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
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/forgot_password/forgot_password_cubit.dart'
    as _i709;
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_in/sign_in_cubit.dart'
    as _i581;
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/sign_up/sign_up_cubit.dart'
    as _i693;
import 'package:paiting_by_numbers/features/auth/navigation/presentation/state/verify_email/verify_email_cubit.dart'
    as _i780;
import 'package:paiting_by_numbers/features/create_painting/data/repositories/quantization_repository_impl.dart'
    as _i266;
import 'package:paiting_by_numbers/features/create_painting/domain/repositories/quantization_repository.dart'
    as _i339;
import 'package:paiting_by_numbers/features/create_painting/domain/use_cases/vectorize_image_use_case.dart'
    as _i486;
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_cubit.dart'
    as _i392;
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_cubit.dart'
    as _i112;
import 'package:paiting_by_numbers/features/home/data/api/paintings_api.dart'
    as _i461;
import 'package:paiting_by_numbers/features/home/data/repositories/paintings_repository_impl.dart'
    as _i376;
import 'package:paiting_by_numbers/features/home/domain/repositories/paintings_repository.dart'
    as _i419;
import 'package:paiting_by_numbers/features/home/domain/use_cases/get_highlighted_paintings_use_case.dart'
    as _i187;
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_cubit.dart'
    as _i445;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseModule = _$FirebaseModule();
    final appModule = _$AppModule();
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i197.SessionCubit>(() => _i197.SessionCubit());
    gh.lazySingleton<_i747.ThemeCubit>(() => _i747.ThemeCubit());
    gh.lazySingleton<_i711.EnvConfig>(() => _i711.EnvConfig.fromDotenv());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
    gh.lazySingleton<_i183.ImagePicker>(() => appModule.imagePicker);
    gh.lazySingleton<_i519.FailureNotifier>(() => _i519.FailureNotifier());
    gh.lazySingleton<_i954.FilePickerService>(
      () => _i351.FilePickerServiceImpl(gh<_i183.ImagePicker>()),
    );
    gh.factory<_i112.UploadImageCubit>(
      () => _i112.UploadImageCubit(
        gh<_i954.FilePickerService>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(() => apiModule.dio(gh<_i711.EnvConfig>()));
    gh.lazySingleton<_i161.AppFlowCubit>(
      () => _i161.AppFlowCubit(gh<_i197.SessionCubit>()),
    );
    gh.lazySingleton<_i339.QuantizationRepository>(
      () => const _i266.QuantizationRepositoryImpl(),
    );
    gh.lazySingleton<_i461.PaintingsApi>(
      () => apiModule.getPaintingsApi(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i664.AuthService>(
      () => _i46.FirebaseAuthService(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    gh.factory<_i486.VectorizeImageUseCase>(
      () => _i486.VectorizeImageUseCase(gh<_i339.QuantizationRepository>()),
    );
    gh.lazySingleton<_i419.PaintingsRepository>(
      () => _i376.PaintingsRepositoryImpl(gh<_i461.PaintingsApi>()),
    );
    gh.lazySingleton<_i729.AuthRepository>(
      () => _i602.AuthRepositoryImpl(gh<_i664.AuthService>()),
    );
    gh.factory<_i321.GetCurrentUserUseCase>(
      () => _i321.GetCurrentUserUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i675.LogOutUseCase>(
      () => _i675.LogOutUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i170.ReloadUserUseCase>(
      () => _i170.ReloadUserUseCase(gh<_i729.AuthRepository>()),
    );
    gh.factory<_i260.SendEmailVerificationUseCase>(
      () => _i260.SendEmailVerificationUseCase(gh<_i729.AuthRepository>()),
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
    gh.factory<_i581.SignInCubit>(
      () => _i581.SignInCubit(
        gh<_i1064.SignInWithEmailUseCase>(),
        gh<_i721.SignInWithGoogleUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.factory<_i187.GetHighlightedPaintingsUseCase>(
      () =>
          _i187.GetHighlightedPaintingsUseCase(gh<_i419.PaintingsRepository>()),
    );
    gh.factory<_i392.CreatePaintingCubit>(
      () => _i392.CreatePaintingCubit(
        gh<_i486.VectorizeImageUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.lazySingleton<_i685.SessionManager>(
      () => _i143.SessionManagerImpl(
        gh<_i197.SessionCubit>(),
        gh<_i750.WatchAuthStateUseCase>(),
        gh<_i321.GetCurrentUserUseCase>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i709.ForgotPasswordCubit>(
      () => _i709.ForgotPasswordCubit(
        gh<_i602.SendPasswordResetLinkUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.factory<_i693.SignUpCubit>(
      () => _i693.SignUpCubit(
        gh<_i443.SignUpWithEmailUseCase>(),
        gh<_i721.SignInWithGoogleUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.factory<_i780.VerifyEmailCubit>(
      () => _i780.VerifyEmailCubit(
        gh<_i260.SendEmailVerificationUseCase>(),
        gh<_i170.ReloadUserUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    gh.lazySingleton<_i909.SessionInitializer>(
      () => _i909.SessionInitializer(gh<_i685.SessionManager>()),
    );
    gh.factory<_i445.ExplorePaintingsCubit>(
      () => _i445.ExplorePaintingsCubit(
        gh<_i187.GetHighlightedPaintingsUseCase>(),
        gh<_i519.FailureNotifier>(),
      ),
    );
    return this;
  }
}

class _$FirebaseModule extends _i83.FirebaseModule {}

class _$AppModule extends _i787.AppModule {}

class _$ApiModule extends _i276.ApiModule {}
