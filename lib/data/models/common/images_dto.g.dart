// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesDto _$ImagesDtoFromJson(Map<String, dynamic> json) => ImagesDto(
      jpg: json['jpg'] == null
          ? null
          : ImageDto.fromJson(json['jpg'] as Map<String, dynamic>),
      webp: json['webp'] == null
          ? null
          : ImageDto.fromJson(json['webp'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesDtoToJson(ImagesDto instance) => <String, dynamic>{
      'jpg': instance.jpg,
      'webp': instance.webp,
    };

ImageDto _$ImageDtoFromJson(Map<String, dynamic> json) => ImageDto(
      imageUrl: json['image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
    );

Map<String, dynamic> _$ImageDtoToJson(ImageDto instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };
