import 'package:animus_mobile_flutter/data/models/common/response_data.dart';
import 'package:animus_mobile_flutter/data/models/anime/top_anime_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/top/anime")
  Future<ResponseData<List<AnimeDto>>> getTopAnime();

  @GET("/anime/{id}")
  Future<ResponseData<AnimeDto>> getAnimeById(@Path("id") int id);
}