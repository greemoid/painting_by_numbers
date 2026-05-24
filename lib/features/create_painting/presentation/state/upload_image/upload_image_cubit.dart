import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:paiting_by_numbers/core/bloc/base_cubit.dart';
import 'package:paiting_by_numbers/core/failures/failure.dart';
import 'package:paiting_by_numbers/core/services/failure_notifier/failure_notifier.dart';
import 'package:paiting_by_numbers/core/services/file_picker/file_picker_service.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_state.dart';

@injectable
class UploadImageCubit extends BaseCubit<UploadImageState> {
  final FilePickerService _filePickerService;

  UploadImageCubit(
    this._filePickerService,
    FailureNotifier failureNotifier,
  ) : super(const UploadImageState(), failureNotifier);

  Future<void> pickImage() async {
    await execute(
      useCase: () => _filePickerService.pickImage(source: ImageSource.gallery),
      showSnackBarOnError: false,
      onSuccess: (file) => safeEmit(state.copyWith(image: file)),
      onError: (failure) {
        if (failure is! CanceledByUserFailure) {
          failureNotifier.notify(failure);
        }
      },
    );
  }

  void clearImage() {
    safeEmit(state.copyWith(image: null));
  }
}
