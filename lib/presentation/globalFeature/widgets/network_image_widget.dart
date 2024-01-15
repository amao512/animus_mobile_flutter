import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageWidget extends StatelessWidget {
  String url;
  double height;
  double width;
  BoxFit fit;

  NetworkImageWidget(
      {super.key,
      required this.url,
      required this.height,
      required this.width,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: url.contains(".svg")
          ? SvgPicture.network(
              url,
              height: height,
              width: width,
              fit: fit,
            )
          : CachedNetworkImage(
              imageUrl: url,
              height: height,
              width: width,
              fit: fit,
            ),
    );
  }
}
