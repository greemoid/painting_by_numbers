import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paiting_by_numbers/features/create_painting/domain/entities/quantization_result.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// todo: remove; for debug purposes only
class QuantizationResultView extends StatelessWidget {
  const QuantizationResultView({required this.result, super.key});

  final QuantizationResult result;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Результат квантизації',
          style: theme.textTheme.large.copyWith(fontWeight: FontWeight.w600),
        ),
        16.verticalSpace,
        AspectRatio(
          aspectRatio: _parseSvgAspectRatio(result.svgContent),
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.muted,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: colorScheme.border),
            ),
            clipBehavior: Clip.antiAlias,
            child: SvgPicture.string(
              result.svgContent,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        24.verticalSpace,
        Text(
          'Колірна палітра (${result.palette.length})',
          style: theme.textTheme.small.copyWith(
            color: colorScheme.mutedForeground,
            fontWeight: FontWeight.w600,
          ),
        ),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: result.palette
              .map((color) => _PaletteChip(color: color))
              .toList(),
        ),
      ],
    );
  }
}

class _PaletteChip extends StatelessWidget {
  const _PaletteChip({required this.color});

  final PaletteColor color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    final rgbColor = Color.fromARGB(
      255,
      color.rgb[0],
      color.rgb[1],
      color.rgb[2],
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colorScheme.card,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: colorScheme.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16.w,
            height: 16.h,
            decoration: BoxDecoration(
              color: rgbColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black.withValues(alpha: 0.1),
                width: 1.w,
              ),
            ),
          ),
          8.horizontalSpace,
          Text(
            color.hex.toUpperCase(),
            style: theme.textTheme.muted.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

double _parseSvgAspectRatio(String svg) {
  try {
    final viewBoxRegex = RegExp(r'viewBox="([^"]+)"');
    final viewBoxMatch = viewBoxRegex.firstMatch(svg);
    if (viewBoxMatch != null) {
      final parts = viewBoxMatch.group(1)!.trim().split(RegExp(r'\s+'));
      if (parts.length == 4) {
        final w = double.tryParse(parts[2]) ?? 0.0;
        final h = double.tryParse(parts[3]) ?? 0.0;
        if (w > 0 && h > 0) return w / h;
      }
    }

    final widthRegex = RegExp(r'width="([^"]+)"');
    final heightRegex = RegExp(r'height="([^"]+)"');
    final wMatch = widthRegex.firstMatch(svg);
    final hMatch = heightRegex.firstMatch(svg);
    if (wMatch != null && hMatch != null) {
      final w = double.tryParse(wMatch.group(1)!) ?? 0.0;
      final h = double.tryParse(hMatch.group(1)!) ?? 0.0;
      if (w > 0 && h > 0) return w / h;
    }
  } catch (_) {}
  return 1.0;
}
