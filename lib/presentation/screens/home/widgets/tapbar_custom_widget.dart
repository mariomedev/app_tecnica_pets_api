import 'package:app_tecnica_pets_api/core/core.dart';
import 'package:flutter/material.dart';

class TapbarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TapbarCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppDimensions.kPadding40,
        AppDimensions.kPadding40,
        AppDimensions.kPadding40,
        0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.kPadding5,
        vertical: AppDimensions.kPadding5,
      ),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(
          AppDimensions.kBorderRadius6,
        ),
        boxShadow: [
          BoxShadow(
            color: colors.brightness == Brightness.light
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.transparent,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        dividerColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.kPadding5,
          vertical: AppDimensions.kPadding5,
        ),
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colors.onPrimaryContainer,
          borderRadius: BorderRadius.circular(
            AppDimensions.kBorderRadius6,
          ),
        ),
        tabs: [
          const Tab(
            child: Text(
              'Breeds',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          const Tab(
            child: Text(
              'Favorites',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 60);
}
