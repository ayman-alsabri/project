import 'package:flutter/material.dart';

class FlatListTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const FlatListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final apptheme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: apptheme.colorScheme.shadow,
      splashFactory: InkSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
          alignment: const Alignment(1, 0),
          padding: const EdgeInsets.all(8),
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: apptheme.colorScheme.tertiary.withOpacity(0.2)),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: apptheme.colorScheme.onPrimary),
          )),
    );
  }
}
