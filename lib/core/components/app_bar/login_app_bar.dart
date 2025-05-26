part of 'app_bar.dart';

class _LoginAppBarWidget extends StatelessWidget {
  const _LoginAppBarWidget({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: ColorName.main,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: const SizedBox.shrink(),
      title: AppText.s20w500TtL(
        title,
        fontWeight: FontWeight.w400,
        color: const Color(0xffF6F6F6),
      ),
    );
  }
}
