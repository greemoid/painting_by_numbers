import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/app_bar/common_app_bar.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_cubit.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_state.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/upload_image/upload_image_cubit.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/widgets/explanation_card.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/widgets/image_picker_area.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/widgets/quantization_settings.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreatePaintingScreen extends StatelessWidget {
  const CreatePaintingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    final uploadState = context.watch<UploadImageCubit>().state;
    final paintingState = context.watch<CreatePaintingCubit>().state;

    final isQuantizing = paintingState.isQuantizing;
    final hasImage = uploadState.image != null;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: CommonAppBar(
        title: LocaleKeys.create_painting_title.tr(),
        showBottomBorder: false,
      ),
      body: IgnorePointer(
        ignoring: isQuantizing,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CreatePaintingExplanationCard(),
              24.verticalSpace,
              ImagePickerArea(state: uploadState),
              32.verticalSpace,
              QuantizationSettings(state: paintingState),
              48.verticalSpace,
              AppButton(
                text: LocaleKeys.create_painting_start_quantization.tr(),
                isLoading: isQuantizing,
                onPressed: !hasImage
                    ? null
                    : () => context
                        .read<CreatePaintingCubit>()
                        .startQuantization(),
              ),
              160.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
