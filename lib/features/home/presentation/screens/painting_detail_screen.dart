import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paiting_by_numbers/app/ui/theme/borders/app_border_radiuses.dart';
import 'package:paiting_by_numbers/core/app_flow/create_painting_flow.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/app_bar/common_app_bar.dart';
import 'package:paiting_by_numbers/core/ui/ui_kit/loaders/app_loader.dart';
import 'package:paiting_by_numbers/core/ui/widgets/ui_kit/app_button.dart';
import 'package:paiting_by_numbers/features/home/domain/entities/painting_detail.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/painting_detail/painting_detail_cubit.dart';
import 'package:paiting_by_numbers/features/home/presentation/state/painting_detail/painting_detail_state.dart';
import 'package:paiting_by_numbers/resources/gen/locale_keys.g.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PaintingDetailScreen extends StatefulWidget {
  final int paintingId;
  final String title;
  final String author;
  final String year;
  final String imageUrl;
  final double aspectRatio;
  final CreatePaintingFlow createPaintingFlow;

  const PaintingDetailScreen({
    super.key,
    required this.paintingId,
    required this.title,
    required this.author,
    required this.year,
    required this.imageUrl,
    required this.aspectRatio,
    required this.createPaintingFlow,
  });

  @override
  State<PaintingDetailScreen> createState() => _PaintingDetailScreenState();
}

class _PaintingDetailScreenState extends State<PaintingDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PaintingDetailCubit>().fetchDetail(widget.paintingId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: CommonAppBar(
        title: widget.title,
        showBackButton: true,
        showBottomBorder: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
                bottom: 120.h, // Space for the bottom floating button
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: widget.imageUrl,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.all(AppBorderRadiuses.roundedLg),
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio,
                        child: CachedNetworkImage(
                          imageUrl: widget.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (context, url) => ColoredBox(
                            color: colorScheme.muted.withValues(alpha: 0.5),
                            child: const Center(child: AppLoader()),
                          ),
                          errorWidget: (context, url, error) => ColoredBox(
                            color: colorScheme.muted.withValues(alpha: 0.3),
                            child: Center(
                              child: Icon(
                                LucideIcons.imageOff,
                                color: colorScheme.mutedForeground,
                                size: 48.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Text(
                    widget.title,
                    style: textTheme.large.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    '${widget.author} • ${widget.year}',
                    style: textTheme.muted.copyWith(
                      fontSize: 14.sp,
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  20.verticalSpace,
                  BlocBuilder<PaintingDetailCubit, PaintingDetailState>(
                    builder: (context, state) {
                      return state.map(
                        initial: (_) => const SizedBox.shrink(),
                        loading: (_) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 40.h),
                          child: const Center(child: AppLoader()),
                        ),
                        error: (e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            children: [
                              Text(
                                e.failure.messageKey.tr(),
                                style: textTheme.muted.copyWith(
                                  color: colorScheme.destructive,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              8.verticalSpace,
                              ShadButton.outline(
                                onPressed: () => context
                                    .read<PaintingDetailCubit>()
                                    .fetchDetail(widget.paintingId),
                                child: Text(LocaleKeys.home_retry.tr()),
                              ),
                            ],
                          ),
                        ),
                        data: (d) => _buildDetailContent(d.detail, context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 24.h,
            child: AppButton(
              text: LocaleKeys.create_painting_start_quantization.tr(),
              onPressed: () => widget.createPaintingFlow.startWithImageUrl(
                context,
                widget.imageUrl,
                title: widget.title,
                author: widget.author,
                year: widget.year,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailContent(PaintingDetail detail, BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (detail.description != null && detail.description!.isNotEmpty) ...[
          Text(
            LocaleKeys.home_about_artwork.tr(),
            style: textTheme.h3.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          8.verticalSpace,
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: colorScheme.muted.withValues(alpha: 0.2),
              borderRadius: BorderRadius.all(AppBorderRadiuses.roundedBase),
              border: Border.all(color: colorScheme.border),
            ),
            child: Text(
              detail.description!,
              style: textTheme.muted.copyWith(
                fontSize: 13.sp,
                color: colorScheme.foreground,
                height: 1.5,
              ),
            ),
          ),
          20.verticalSpace,
        ],
        Text(
          LocaleKeys.create_painting_explanation_title.tr(),
          style: textTheme.h3.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        8.verticalSpace,
        Table(
          border: TableBorder.symmetric(
            inside: BorderSide(color: colorScheme.border, width: 0.5),
          ),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
          },
          children: [
            if (detail.technique != null)
              _buildTableRow(
                LocaleKeys.home_technique.tr(),
                detail.technique!,
                context,
              ),
            if (detail.culture != null && detail.culture!.isNotEmpty)
              _buildTableRow(
                LocaleKeys.home_culture.tr(),
                detail.culture!.join(', '),
                context,
              ),
            if (detail.measurements != null)
              _buildTableRow(
                LocaleKeys.home_dimensions.tr(),
                detail.measurements!,
                context,
              ),
            if (detail.department != null)
              _buildTableRow(
                LocaleKeys.home_department.tr(),
                detail.department!,
                context,
              ),
          ],
        ),
        if (detail.authorBiography != null &&
            detail.authorBiography!.isNotEmpty) ...[
          20.verticalSpace,
          Text(
            LocaleKeys.home_biography.tr(),
            style: textTheme.h3.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          8.verticalSpace,
          Text(
            detail.authorBiography!,
            style: textTheme.muted.copyWith(
              fontSize: 13.sp,
              color: colorScheme.foreground,
              height: 1.5,
            ),
          ),
        ],
      ],
    );
  }

  TableRow _buildTableRow(String label, String value, BuildContext context) {
    final theme = ShadTheme.of(context);
    final textTheme = theme.textTheme;
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          child: Text(
            label,
            style: textTheme.muted.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          child: Text(
            value,
            style: textTheme.muted.copyWith(
              color: theme.colorScheme.foreground,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
