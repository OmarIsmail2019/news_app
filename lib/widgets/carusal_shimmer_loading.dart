import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenLoading extends StatefulWidget {
  const HomeScreenLoading({super.key});

  @override
  State<HomeScreenLoading> createState() => _HomeScreenLoadingState();
}

class _HomeScreenLoadingState extends State<HomeScreenLoading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemBuilder: ((context, index, realIndex) {
                return buildContainerShimmer();
              }),
              itemCount: 2,
              options:
                  CarouselOptions(aspectRatio: 20 / 9, enlargeCenterPage: true),
            ),
            const SizedBox(
              height: 25,
            ),
            ListView.separated(
                primary: true,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return buildContainerShimmer();
                })
          ],
        ),
      ),
    );
  }

  Widget buildContainerShimmer() => Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 248, 230, 230)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade600,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      );
}
