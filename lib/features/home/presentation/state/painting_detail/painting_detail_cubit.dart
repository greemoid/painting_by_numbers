import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting_detail.dart';
import 'package:paiting_by_numbers/features/home/domain/use_cases/get_artwork_detail_use_case.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/painting_detail/painting_detail_state.dart';

@injectable
class PaintingDetailCubit extends BaseCubit<PaintingDetailState> {
  final GetArtworkDetailUseCase _getArtworkDetailUseCase;

  PaintingDetailCubit(
    this._getArtworkDetailUseCase,
    FailureNotifier failureNotifier,
  ) : super(const PaintingDetailState.initial(), failureNotifier);

  Future<void> fetchDetail(int id) async {
    emit(const PaintingDetailState.loading());
    await execute<PaintingDetail>(
      useCase: () => _getArtworkDetailUseCase(id),
      onSuccess: (detail) => emit(PaintingDetailState.data(detail)),
      onError: (failure) => emit(PaintingDetailState.error(failure)),
    );
  }
}
