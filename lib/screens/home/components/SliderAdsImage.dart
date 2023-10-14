// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_home_member/config/constanent.dart';
import 'package:super_home_member/screens/home/bloc/OfferSliderController.dart';

class SliderAdsImage extends StatelessWidget {
  const SliderAdsImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferSliderController>(
        init: OfferSliderController(),
        builder: (controller) {
          if (controller.sliders.isEmpty) {
            return Container();
          }
          return Container(
            padding: defaultPaddingEdge,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 150,
                aspectRatio: 1 / 1,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: controller.sliders
                  .map(
                    (slider) => Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                        child: CachedNetworkImage(
                          imageUrl: slider.src,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2)),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        });
  }
}
