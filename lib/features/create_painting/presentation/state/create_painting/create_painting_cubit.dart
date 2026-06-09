import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/core/services/storage/file_storage_service.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/use_cases/vectorize_image_use_case.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_state.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/quantization_type.dart';
import 'package:paiting_by_numbers/features/gallery/domain/entities/painting_entity.dart';
import 'package:paiting_by_numbers/features/gallery/domain/use_cases/save_generated_painting_use_case.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:uuid/uuid.dart';

@injectable
class CreatePaintingCubit extends BaseCubit<CreatePaintingState> {
  final VectorizeImageUseCase _vectorizeImageUseCase;
  final SaveGeneratedPaintingUseCase _savePaintingUseCase;
  final FileStorageService _fileStorageService;
  final FirebaseAuth _firebaseAuth;

  CreatePaintingCubit(
    this._vectorizeImageUseCase,
    this._savePaintingUseCase,
    this._fileStorageService,
    this._firebaseAuth,
    FailureNotifier failureNotifier,
  ) : super(const CreatePaintingState(), failureNotifier);

  void setQuantizationType(QuantizationType type) {
    safeEmit(state.copyWith(quantizationType: type));
  }

  void setCustomColorsCount(int count) {
    safeEmit(state.copyWith(customColorsCount: count));
  }

  void setInitialMetadata({String? title, String? author, String? year}) {
    safeEmit(state.copyWith(
      initialTitle: title,
      initialAuthor: author,
      initialYear: year != null ? int.tryParse(year) : null,
    ));
  }

  Future<void> startQuantization(File image) async {
    final colorsCount = state.quantizationType.colorsCount(
      state.customColorsCount,
    );

    await execute<QuantizationResult>(
      onStart: () => safeEmit(state.copyWith(isQuantizing: true)),
      onComplete: () => safeEmit(state.copyWith(isQuantizing: false)),
      useCase: () async {
        final bytes = await image.readAsBytes();
        final result = await _vectorizeImageUseCase(
          imageBytes: bytes,
          colors: colorsCount,
        );

        switch (result) {
          case Left(:final value):
            return Left(value);
          case Right(:final value):
            final paintingId = const Uuid().v4();
            final fileName = '$paintingId.svg';

            final localPath = await _fileStorageService.saveStringToFile(
              content: value.svgContent,
              fileName: fileName,
            );

            final userId = _firebaseAuth.currentUser?.uid ?? 'guest';

            final entity = GeneratedPaintingEntity(
              id: paintingId,
              name: state.initialTitle ??
                  LocaleKeys.create_painting_default_painting_name.tr(),
              artist: state.initialAuthor ??
                  LocaleKeys.create_painting_default_artist.tr(),
              year: state.initialYear ?? DateTime.now().year,
              localImagePath: localPath,
              colors: value.palette.map((p) => p.hex).toList(),
              createdAt: DateTime.now(),
            );

            // Fire and forget to avoid blocking UI if Firestore is offline
            _savePaintingUseCase(userId, entity).catchError((e) {
              // Ignore error, Firestore offline cache will eventually sync it
              // or it fails silently in background
            });

            return Right(value);
        }
      },
      onSuccess: (result) =>
          safeEmit(state.copyWith(quantizationResult: result)),
    );
  }
}
