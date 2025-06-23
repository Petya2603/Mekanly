import 'dart:math' show pi;

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gen/gen.dart';

import '../../core/components/app_btn.dart';
import '../../core/components/app_text.dart';
import '../../product/constants/constants.dart';
import '../../utils/extensions.dart';

class HouseImages extends StatelessWidget {
  const HouseImages({super.key, required this.houseImagesUrl});
  final List<String?>? houseImagesUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Assets.icons.icBack.svg(package: 'gen'),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  _showAnimatedBottomSheet(context);
                  //shareButton(context);
                },
                icon: Assets.icons.icShare.svg(package: 'gen'),
              ),
              6.boxW,
              IconButton(
                onPressed: () {},
                icon: Assets.icons.icHeart.svg(
                  package: 'gen',
                ),
              ),
            ],
          ),
        ],
      ),
      body: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 6,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          pattern: [
            const QuiltedGridTile(4, 6),
            const QuiltedGridTile(2, 3),
            const QuiltedGridTile(2, 3),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ImageScreen(
                    imagesUrl: houseImagesUrl,
                    initialIndex: index + 1,
                  ),
                ),
              );
            },
            child: LayoutBuilder(
              builder: (context, constraints) => CustomNetworkImage(
                imageUrl: houseImagesUrl?[index],
                memCache: CustomMemCache(
                  // height: constraints.maxHeight.toInt(),
                  width: constraints.maxWidth.toInt(),
                ),
              ),
            ),
          ),
          childCount: houseImagesUrl?.length,
        ),
      ),
    );
  }

  void _showAnimatedBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFF5F0EA),
      builder: (context) => _AnimatedContainersSheet(
        imageUrlFirst: houseImagesUrl?[0],
        imageUrlSecond: houseImagesUrl?[0],
        imageUrlThird: houseImagesUrl?[0],
        imagesNumber: houseImagesUrl?.length ?? 0,
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  const ImageScreen({
    super.key,
    required this.imagesUrl,
    required this.initialIndex,
  });
  final List<String?>? imagesUrl;
  final int initialIndex;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late List<double> _rotationAngles;
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex - 1;
    _pageController = PageController(initialPage: widget.initialIndex - 1);
    _rotationAngles = List.generate(widget.imagesUrl?.length ?? 0, (_) => 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _rotateImage() {
    setState(() {
      _rotationAngles[_currentIndex] += pi / 2;
    });
  }

  // final ValueNotif



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Assets.icons.icBackImage.svg(package: 'gen'),
        ),
        title: AppText.s14w400BdM(
          '${_currentIndex + 1}/${widget.imagesUrl?.length}',
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: StringConstants.roboto,
          color: const Color(0xFFFFFFFF),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _rotateImage,
            icon: Assets.icons.icRotateImage.svg(package: 'gen'),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: widget.imagesUrl?.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            minScale: 0.2,
            maxScale: 3,
            child: Center(
              child: Transform.rotate(
                angle: _rotationAngles[index],
                child: Image.network(
                  widget.imagesUrl?[index] ?? '',
                  height: height,
                  cacheWidth: width.toInt().withDevicePixel(context),
                  cacheHeight: height.toInt().withDevicePixel(context),
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                        color: Colors.white,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 48,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF000000),
        onPressed: () {},
        child: Assets.icons.icDownloadImage.svg(package: 'gen'),
      ),
    );
  }

  




}

class _AnimatedContainersSheet extends StatefulWidget {
  const _AnimatedContainersSheet({
    required this.imageUrlFirst,
    required this.imageUrlSecond,
    required this.imageUrlThird,
    required this.imagesNumber,
  });

  final String? imageUrlFirst;
  final String? imageUrlSecond;
  final String? imageUrlThird;
  final int imagesNumber;
  @override
  _AnimatedContainersSheetState createState() =>
      _AnimatedContainersSheetState();
}

class _AnimatedContainersSheetState extends State<_AnimatedContainersSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnim1;
  late Animation<double> _rotationAnim2;
  late Animation<double> _translationAnim;
  late Animation<double> _horizontalTranslationAnim1;
  late Animation<double> _horizontalTranslationAnim2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnim1 = Tween<double>(
      begin: 0,
      end: -pi / 30,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _rotationAnim2 = Tween<double>(
      begin: 0,
      end: pi / 30,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _translationAnim = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _horizontalTranslationAnim1 = Tween<double>(
      begin: 0,
      end: -10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _horizontalTranslationAnim2 = Tween<double>(
      begin: 0,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  bool isLinkSelected = true;
  bool isImageSelected = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
                margin: const EdgeInsets.only(bottom: 20),
              ),
              const SizedBox(height: 25),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  if (widget.imagesNumber == 1) {
                    return Center(
                      child: _buildImageContainer(widget.imageUrlFirst!),
                    );
                  } else if (widget.imagesNumber == 2) {
                    return Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(_horizontalTranslationAnim1.value, 0),
                          child: Transform.rotate(
                            angle: _rotationAnim1.value,
                            alignment: Alignment.bottomLeft,
                            child: _buildImageContainer(
                              widget.imageUrlSecond!,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(_horizontalTranslationAnim2.value, 0),
                          child: Transform.rotate(
                            angle: _rotationAnim2.value,
                            alignment: Alignment.bottomRight,
                            child: _buildImageContainer(
                              widget.imageUrlFirst!,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        Transform.translate(
                          offset: Offset(0, _translationAnim.value),
                          child: _buildImageContainer(
                            widget.imageUrlThird!,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(_horizontalTranslationAnim1.value, 0),
                          child: Transform.rotate(
                            angle: _rotationAnim1.value,
                            alignment: Alignment.bottomLeft,
                            child: _buildImageContainer(
                              widget.imageUrlSecond!,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(_horizontalTranslationAnim2.value, 0),
                          child: Transform.rotate(
                            angle: _rotationAnim2.value,
                            alignment: Alignment.bottomRight,
                            child: _buildImageContainer(
                              widget.imageUrlFirst!,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
              6.boxH,
              AppText.s14w400BdM(
                'Halanlaryňy dostlaryň\nbilen paýlaş',
                fontFamily: StringConstants.roboto,
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: const Color(0xFF222222),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              4.boxH,
              CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
                ),
                activeColor: const Color(0xFFFFFFFF),
                checkColor: const Color(0xFF000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
                ),
                side: BorderSide(
                  color: const Color(0xFFB0B0B0),
                  width: 1.w,
                ),
                title: AppText.s14w400BdM(
                  'Link paýlaş',
                  fontFamily: StringConstants.roboto,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                value: isLinkSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isLinkSelected = value!;
                    isImageSelected = !value;
                  });
                },
              ),
              CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
                ),
                //activeColor: const Color(0xFF212121),
                checkColor: const Color(0xFF000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4).r,
                ),
                side: BorderSide(
                  color: const Color(0xFFB0B0B0),
                  width: 1.w,
                ),
                title: AppText.s14w400BdM(
                  'Surat paýlaş',
                  fontFamily: StringConstants.roboto,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                value: isImageSelected,
                onChanged: (bool? value) {
                  setState(() {
                    isImageSelected = value!;
                    isLinkSelected = !value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18).w,
                child: AppBtn(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Paýlaşmak',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: StringConstants.manrope,
                  textColor: const Color(0xFFFFFFFF),
                  bgColor: const Color(0xFF222222),
                  ltIcon: const Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            child: IconButton.outlined(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.clear,
                color: Colors.grey,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imageUrl) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).r,
        border: Border(
          right: BorderSide(
            width: 2.w,
            color: Colors.white,
          ),
          left: BorderSide(
            width: 2.w,
            color: Colors.white,
          ),
          top: BorderSide(
            width: 2.w,
            color: Colors.white,
          ),
          bottom: BorderSide(
            width: 2.w,
            color: Colors.white,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
        child: Image.network(
          imageUrl,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
          // Use placeholders for better UX
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.error));
          },
        ),
      ),
    );
  }
}
