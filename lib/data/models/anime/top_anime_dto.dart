import 'package:animus_mobile_flutter/data/models/common/images_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_anime_dto.g.dart';

@JsonSerializable()
class AnimeDto {
  AnimeDto({
    required this.images,
    required this.url,
    required this.status,
    required this.id,
    required this.title,
    required this.episodes,
    required this.titleEnglish,
    required this.synopsis,
    required this.year,
    required this.rating,
    required this.trailer,
  });

  @JsonKey(name: "mal_id")
  final int? id;
  final String? url;
  final ImagesDto? images;
  final String? title;
  @JsonKey(name: "title_english")
  final String? titleEnglish;
  final int? episodes;
  final String? status;
  final String? synopsis;
  final int? year;
  final String? rating;
  final TrailerDto? trailer;

  factory AnimeDto.fromJson(Map<String, dynamic> json) =>
      _$AnimeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDtoToJson(this);
}

@JsonSerializable()
class TrailerDto {
  TrailerDto({
    required this.url,
    required this.embedUrl,
    required this.images,
    required this.youtubeId,
  });

  @JsonKey(name: "youtube_id")
  final String? youtubeId;
  final String? url;
  @JsonKey(name: "embed_url")
  final String? embedUrl;
  final TrailerImagesDto? images;

  factory TrailerDto.fromJson(Map<String, dynamic> json) =>
      _$TrailerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerDtoToJson(this);
}

@JsonSerializable()
class TrailerImagesDto {
  TrailerImagesDto({
    required this.largeImageUrl,
    required this.imageUrl,
    required this.maximumImageUrl,
    required this.mediumImageUrl,
    required this.smallImageUrl,
  });

  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "medium_image_url")
  final String? mediumImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;
  @JsonKey(name: "maximum_image_url")
  final String? maximumImageUrl;

  factory TrailerImagesDto.fromJson(Map<String, dynamic> json) =>
      _$TrailerImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerImagesDtoToJson(this);
}
