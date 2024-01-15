import 'package:alabs_flutter_core/core/ui/constants/constants.dart';
import 'package:animus_mobile_flutter/data/models/anime/top_anime_dto.dart';
import 'package:animus_mobile_flutter/domain/models/common/images_dvo.dart';

class AnimeDvo {
  AnimeDvo({
    required this.images,
    required this.url,
    required this.status,
    required this.id,
    required this.title,
    required this.episodes,
    required this.titleEnglish,
    required this.synopsis,
    required this.rating,
    required this.year,
    required this.trailer,
  });

  factory AnimeDvo.map(AnimeDto? dto) => AnimeDvo(
        images: ImagesDvo.map(dto?.images),
        url: dto?.url ?? CoreConstants.empty,
        status: dto?.status ?? CoreConstants.empty,
        id: dto?.id ?? CoreConstants.zero,
        title: dto?.title ?? CoreConstants.empty,
        episodes: dto?.episodes ?? CoreConstants.zero,
        titleEnglish: dto?.titleEnglish ?? CoreConstants.empty,
        synopsis: dto?.synopsis ?? CoreConstants.empty,
        rating: dto?.rating ?? CoreConstants.empty,
        year: dto?.year ?? CoreConstants.zero,
        trailer: TrailerDvo.map(dto?.trailer),
      );

  final int id;
  final String url;
  final ImagesDvo images;
  final String title;
  final String titleEnglish;
  final int episodes;
  final String status;
  final String synopsis;
  final String rating;
  final int year;
  final TrailerDvo trailer;
}

class TrailerDvo {
  TrailerDvo({
    required this.url,
    required this.embedUrl,
    required this.images,
    required this.youtubeId,
  });

  factory TrailerDvo.map(TrailerDto? dto) => TrailerDvo(
        url: dto?.url ?? CoreConstants.empty,
        embedUrl: dto?.embedUrl ?? CoreConstants.empty,
        images: TrailerImagesDvo.map(dto?.images),
        youtubeId: dto?.youtubeId ?? CoreConstants.empty,
      );

  final String youtubeId;
  final String url;
  final String embedUrl;
  final TrailerImagesDvo images;
}

class TrailerImagesDvo {
  TrailerImagesDvo({
    required this.largeImageUrl,
    required this.imageUrl,
    required this.maximumImageUrl,
    required this.mediumImageUrl,
    required this.smallImageUrl,
  });

  factory TrailerImagesDvo.map(TrailerImagesDto? dto) => TrailerImagesDvo(
        smallImageUrl: dto?.smallImageUrl ?? CoreConstants.empty,
        largeImageUrl: dto?.largeImageUrl ?? CoreConstants.empty,
        imageUrl: dto?.imageUrl ?? CoreConstants.empty,
        maximumImageUrl: dto?.maximumImageUrl ?? CoreConstants.empty,
        mediumImageUrl: dto?.mediumImageUrl ?? CoreConstants.empty,
      );

  final String imageUrl;
  final String smallImageUrl;
  final String mediumImageUrl;
  final String largeImageUrl;
  final String maximumImageUrl;
}
