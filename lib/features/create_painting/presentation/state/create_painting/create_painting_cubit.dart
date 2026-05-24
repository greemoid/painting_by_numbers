import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/snack_bar/custom_snack_bar.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/use_cases/vectorize_image_use_case.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_state.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/quantization_type.dart';

@injectable
class CreatePaintingCubit extends BaseCubit<CreatePaintingState> {
  final VectorizeImageUseCase _vectorizeImageUseCase;

  CreatePaintingCubit(
    this._vectorizeImageUseCase,
    FailureNotifier failureNotifier,
  ) : super(const CreatePaintingState(), failureNotifier);

  void setQuantizationType(QuantizationType type) {
    safeEmit(state.copyWith(quantizationType: type));
  }

  void setCustomColorsCount(int count) {
    safeEmit(state.copyWith(customColorsCount: count));
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
        return _vectorizeImageUseCase(imageBytes: bytes, colors: colorsCount);
      },
      onSuccess: (result) {
        safeEmit(state.copyWith(quantizationResult: result));
        CustomSnackBar.showSuccessSnackBar(
          message: 'Картину успішно згенеровано!',
        );
      },
    );
  }
}
