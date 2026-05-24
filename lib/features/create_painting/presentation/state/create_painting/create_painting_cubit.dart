import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_state.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/quantization_type.dart';

@injectable
class CreatePaintingCubit extends BaseCubit<CreatePaintingState> {
  CreatePaintingCubit(FailureNotifier failureNotifier)
      : super(const CreatePaintingState(), failureNotifier);

  void setQuantizationType(QuantizationType type) {
    safeEmit(state.copyWith(quantizationType: type));
  }

  void setCustomColorsCount(int count) {
    safeEmit(state.copyWith(customColorsCount: count));
  }

  Future<void> startQuantization() async {
    emit(state.copyWith(isQuantizing: true));

    // TODO: implement actual quantization
    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(isQuantizing: false));
  }
}
