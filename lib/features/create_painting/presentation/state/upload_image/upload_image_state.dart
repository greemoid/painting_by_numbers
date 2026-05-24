import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_state.freezed.dart';

@freezed
abstract class UploadImageState with _$UploadImageState {
  const factory UploadImageState({File? image}) = _UploadImageState;
}
