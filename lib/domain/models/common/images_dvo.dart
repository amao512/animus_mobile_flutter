import 'package:alabs_flutter_core/core/ui/constants/constants.dart';
import 'package:animus_mobile_flutter/data/models/common/images_dto.dart';

class ImagesDvo {
  ImagesDvo({
    required this.jpg,
    required this.webp,
  });

  factory ImagesDvo.map(ImagesDto? dto) => ImagesDvo(
        jpg: ImageDvo.map(dto?.jpg),
        webp: ImageDvo.map(dto?.webp),
      );

  final ImageDvo jpg;
  final ImageDvo webp;
}

class ImageDvo {
  ImageDvo({
    required this.imageUrl,
    required this.largeImageUrl,
    required this.smallImageUrl,
  });

  factory ImageDvo.map(ImageDto? dto) => ImageDvo(
        imageUrl: dto?.imageUrl ?? CoreConstants.empty,
        largeImageUrl: dto?.largeImageUrl ?? CoreConstants.empty,
        smallImageUrl: dto?.smallImageUrl ?? CoreConstants.empty,
      );

  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;
}
