// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
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
import 'package:paiting_by_numbers/core/di/modules/app_module.dart' as _i787;
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart'
    as _i519;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i197.SessionCubit>(() => _i197.SessionCubit());
    gh.lazySingleton<_i802.ThemeCubit>(() => _i802.ThemeCubit());
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
    return this;
  }
}

class _$AppModule extends _i787.AppModule {}
