part of 'app_bar.dart';

class _BaseAppBarWidget extends StatelessWidget {
  const _BaseAppBarWidget({required this.title, this.actions});
  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3), // X: 0, Y: 1
            blurRadius: 3, // Blur: 3
            color: Colors.black12, // #000000 with 5% opacity
          ),
        ],
      ),
      child: AppBar(
        centerTitle: true,
        backgroundColor: ColorName.main,
        elevation: 0,
        actions: actions,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SizedBox(
            height: 24.w,
            width: 24.w,
            child: Assets.icons.icBack.svg(package:
              'gen',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ).toCenter(),
        ),
        title: AppText.s16w400BdL(
          title,
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
