import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_widths.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_cubit.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_state.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ImagePickerArea extends StatelessWidget {
  const ImagePickerArea({required this.state, super.key});

  final UploadImageState state;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    if (state.image != null) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(AppBorderRadiuses.rounded),
            child: Image.file(
              state.image!,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          16.verticalSpace,
          AppButton.outline(
            text: LocaleKeys.create_painting_change_image.tr(),
            leading: const Icon(LucideIcons.image),
            onPressed: () => context.read<UploadImageCubit>().pickImage(),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: () => context.read<UploadImageCubit>().pickImage(),
      child: Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.muted.withValues(alpha: 0.5),
          borderRadius: BorderRadius.all(AppBorderRadiuses.rounded),
          border: Border.all(
            color: colorScheme.border,
            width: AppBorderWidths.border,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.upload,
              size: 48.r,
              color: colorScheme.mutedForeground,
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.create_painting_pick_image.tr(),
              style: theme.textTheme.large.copyWith(
                color: colorScheme.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
