import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsListShimmer extends StatelessWidget {
  const NewsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white10,
      highlightColor: Colors.white30,
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.white30,
          ),
          Container(
            height: 250,
            width: double.infinity,
          ),
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.white30,
          ),

        ],
      ),
    );
  }
}
