import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_cubit.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/create_painting/create_painting_state.dart';
import 'package:paiting_by_numbers/features/create_painting/presentation/state/quantization_type.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class QuantizationSettings extends StatelessWidget {
  const QuantizationSettings({required this.state, super.key});

  final CreatePaintingState state;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          LocaleKeys.create_painting_quantization_type.tr(),
          style: theme.textTheme.large.copyWith(fontWeight: FontWeight.w600),
        ),
        10.verticalSpace,
        ShadSelect<QuantizationType>(
          placeholder: Text(
            LocaleKeys.create_painting_select_detail_level.tr(),
          ),
          initialValue: state.quantizationType,
          onChanged: (type) {
            if (type != null) {
              context.read<CreatePaintingCubit>().setQuantizationType(type);
            }
          },
          selectedOptionBuilder: (context, type) => Text(type.name),
          options: QuantizationType.values.map(
            (type) => ShadOption(value: type, child: Text(type.name)),
          ),
        ),
        if (state.quantizationType == QuantizationType.custom) ...[
          16.verticalSpace,
          Text(
            LocaleKeys.create_painting_colors_count.tr(
              args: [state.customColorsCount.toString()],
            ),
            style: theme.textTheme.small.copyWith(
              color: colorScheme.mutedForeground,
            ),
          ),
          8.verticalSpace,
          ShadSlider(
            initialValue: state.customColorsCount.toDouble(),
            min: 10,
            max: 40,
            onChanged: (value) => context
                .read<CreatePaintingCubit>()
                .setCustomColorsCount(value.toInt()),
          ),
        ],
      ],
    );
  }
}
