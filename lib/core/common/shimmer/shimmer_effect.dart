import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management/constant/app_padding.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const ShimmerListView({
    super.key,
    required this.itemCount,
    this.padding,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Divider(thickness: 0.2.h, color: Colors.grey[500]),
        );
      },
      itemCount: itemCount,
      padding: padding,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemBuilder: (context, index) => buildBasicShimmerListTile(),
    );
  }

  Widget buildBasicShimmerListTile() {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: const Color.fromARGB(255, 225, 225, 225),
      highlightColor: const Color.fromARGB(255, 202, 202, 202),
      child: ListTile(
        leading: CircleAvatar(radius: 25, backgroundColor: Colors.grey[300]),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 14,
              width: 50,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 12,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 12,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildShimmerCarousel({
  required BuildContext context,
  required int itemCount,
  required Widget body,
  required double viewportFraction,
  required double height,
}) {
  return CarouselSlider.builder(
    itemCount: itemCount,
    itemBuilder: (context, index, realIndex) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: body,
      );
    },
    options: CarouselOptions(
      height: height,
      aspectRatio: 16 / 9,
      autoPlayInterval: const Duration(microseconds: 10),
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: viewportFraction,
      scrollDirection: Axis.horizontal,
      enableInfiniteScroll: true,
    ),
  );
}

Widget normalListviewShimmerEffet() {
  return Padding(
    padding: AppPadding.contentPadding,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          enabled: true,
          baseColor: const Color.fromARGB(255, 225, 225, 225),
          highlightColor: const Color.fromARGB(255, 202, 202, 202),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image placeholder
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Title placeholder
                  Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Subtitle placeholder
                  Container(
                    height: 12,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget normalTextShimmer() {
  return Padding(
    padding: AppPadding.contentPadding,
    child: ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          enabled: true,
          baseColor: const Color.fromARGB(255, 225, 225, 225),
          highlightColor: const Color.fromARGB(255, 202, 202, 202),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title placeholder
                Container(
                  height: 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle placeholder line 1
                Container(
                  height: 14,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 6),

                // Subtitle placeholder line 2
                Container(
                  height: 14,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
