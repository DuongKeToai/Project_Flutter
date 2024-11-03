import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'movie_type_section.dart';
class UpcomingSection extends StatelessWidget {
  final List<String> listUpcommingMoviesPoster;

  final void Function(int index) setStateFunc;
  const UpcomingSection({
    Key? key,
    required this.listUpcommingMoviesPoster,
    required this.setStateFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: MovieTypeSection(
          title: "Upcomming",
          child: CarouselSlider.builder(
            itemCount: listUpcommingMoviesPoster.length,
            itemBuilder: (context, currentIndex, pageViewIndex) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          listUpcommingMoviesPoster[currentIndex]))),
              // child: Text("Index: $currentIndex $pageViewIndex"),
            ),
            options: CarouselOptions(
              height: 268,
              //! Aspect ratio được dùng để tự căn chỉnh chiều cao dự trên tỉ lệ height/width.
              // aspectRatio: 1.25,
              viewportFraction: 0.5,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, _) {
                setStateFunc.call(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          )),
    );
  }
}
