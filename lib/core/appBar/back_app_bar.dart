import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:project/core/buttons/app_bar_btn.dart';


class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Future<void> Function()? onWillPop;

  const BackAppBar({
    super.key,
    required this.title,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: AppBarButton(
                    onTap: () async {
                      if (onWillPop != null) {
                        await onWillPop!();
                      }
                      Get.back();
                    },
                    icon: Icons.arrow_back_ios_new),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: Get.theme.colorScheme.onTertiary,
                  fontSize: 26,
                  fontWeight: FontWeight.w700),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
