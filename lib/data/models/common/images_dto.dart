import 'package:json_annotation/json_annotation.dart';

part 'images_dto.g.dart';

@JsonSerializable()
class ImagesDto {
  ImagesDto({
    required this.jpg,
    required this.webp,
  });

  final ImageDto? jpg;
  final ImageDto? webp;

  factory ImagesDto.fromJson(Map<String, dynamic> json) =>
      _$ImagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesDtoToJson(this);
}

@JsonSerializable()
class ImageDto {
  ImageDto({
    required this.imageUrl,
    required this.largeImageUrl,
    required this.smallImageUrl,
  });

  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "small_image_url")
  final String? smallImageUrl;
  @JsonKey(name: "large_image_url")
  final String? largeImageUrl;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDtoToJson(this);
}
