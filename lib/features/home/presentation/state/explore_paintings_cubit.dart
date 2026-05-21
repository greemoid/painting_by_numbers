import 'package:injectable/injectable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/paintings_page.dart';
import 'package:paiting_by_numbers/features/home/domain/use_cases/get_highlighted_paintings_use_case.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/explore_paintings_state.dart';

const _pageSize = 20;

@injectable
class ExplorePaintingsCubit extends BaseCubit<ExplorePaintingsState> {
  final GetHighlightedPaintingsUseCase _getHighlightedPaintingsUseCase;

  ExplorePaintingsCubit(
    this._getHighlightedPaintingsUseCase,
    FailureNotifier failureNotifier,
  ) : super(const ExplorePaintingsState.initial(), failureNotifier);

  Future<void> fetchNextPage() async {
    final currentState = state;

    int nextSkip = 0;
    List<List<Painting>> currentPages = [];
    List<int> currentKeys = [];
    int loadedCount = 0;
    int knownTotal = 0;

    final shouldFetch = currentState.map(
      initial: (_) {
        emit(const ExplorePaintingsState.loading());
        return true;
      },
      loading: (_) => false,
      error: (_) {
        emit(const ExplorePaintingsState.loading());
        return true;
      },
      data: (d) {
        if (d.pagingState.isLoading) return false;
        if (!d.pagingState.hasNextPage) return false;

        currentPages = d.pagingState.pages ?? [];
        currentKeys = d.pagingState.keys ?? [];
        loadedCount = currentPages.fold(0, (sum, page) => sum + page.length);
        knownTotal = d.total;
        nextSkip = loadedCount;

        emit(
          ExplorePaintingsState.data(
            pagingState: d.pagingState.copyWith(isLoading: true, error: null),
            items: d.items,
            total: knownTotal,
          ),
        );
        return true;
      },
    );

    if (!shouldFetch) return;

    await execute<PaintingsPage>(
      useCase: () =>
          _getHighlightedPaintingsUseCase(skip: nextSkip, limit: _pageSize),
      onSuccess: (page) {
        final allLoaded = loadedCount + page.items.length;
        final hasNext = allLoaded < page.total;

        final newPages = [...currentPages, page.items];
        final newItems = newPages.expand((e) => e).toList();

        emit(
          ExplorePaintingsState.data(
            pagingState: PagingState<int, Painting>(
              pages: newPages,
              keys: [...currentKeys, nextSkip],
              hasNextPage: hasNext,
              isLoading: false,
            ),
            items: newItems,
            total: page.total,
          ),
        );
      },
      onError: (failure) {
        state.map(
          initial: (_) => emit(ExplorePaintingsState.error(failure)),
          loading: (_) => emit(ExplorePaintingsState.error(failure)),
          error: (_) => emit(ExplorePaintingsState.error(failure)),
          data: (d) => emit(
            ExplorePaintingsState.data(
              pagingState: d.pagingState.copyWith(
                error: failure,
                isLoading: false,
              ),
              items: d.items,
              total: d.total,
            ),
          ),
        );
      },
    );
  }
}
