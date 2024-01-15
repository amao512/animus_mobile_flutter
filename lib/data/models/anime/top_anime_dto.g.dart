// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_anime_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDto _$AnimeDtoFromJson(Map<String, dynamic> json) => AnimeDto(
      images: json['images'] == null
          ? null
          : ImagesDto.fromJson(json['images'] as Map<String, dynamic>),
      url: json['url'] as String?,
      status: json['status'] as String?,
      id: json['mal_id'] as int?,
      title: json['title'] as String?,
      episodes: json['episodes'] as int?,
      titleEnglish: json['title_english'] as String?,
      synopsis: json['synopsis'] as String?,
      year: json['year'] as int?,
      rating: json['rating'] as String?,
      trailer: json['trailer'] == null
          ? null
          : TrailerDto.fromJson(json['trailer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDtoToJson(AnimeDto instance) => <String, dynamic>{
      'mal_id': instance.id,
      'url': instance.url,
      'images': instance.images,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'episodes': instance.episodes,
      'status': instance.status,
      'synopsis': instance.synopsis,
      'year': instance.year,
      'rating': instance.rating,
      'trailer': instance.trailer,
    };

TrailerDto _$TrailerDtoFromJson(Map<String, dynamic> json) => TrailerDto(
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
      images: json['images'] == null
          ? null
          : TrailerImagesDto.fromJson(json['images'] as Map<String, dynamic>),
      youtubeId: json['youtube_id'] as String?,
    );

Map<String, dynamic> _$TrailerDtoToJson(TrailerDto instance) =>
    <String, dynamic>{
      'youtube_id': instance.youtubeId,
      'url': instance.url,
      'embed_url': instance.embedUrl,
      'images': instance.images,
    };

TrailerImagesDto _$TrailerImagesDtoFromJson(Map<String, dynamic> json) =>
    TrailerImagesDto(
      largeImageUrl: json['large_image_url'] as String?,
      imageUrl: json['image_url'] as String?,
      maximumImageUrl: json['maximum_image_url'] as String?,
      mediumImageUrl: json['medium_image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
    );

Map<String, dynamic> _$TrailerImagesDtoToJson(TrailerImagesDto instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'medium_image_url': instance.mediumImageUrl,
      'large_image_url': instance.largeImageUrl,
      'maximum_image_url': instance.maximumImageUrl,
    };
