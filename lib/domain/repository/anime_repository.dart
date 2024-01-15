import 'package:alabs_flutter_core/core/data/models/result_api.dart';
import 'package:animus_mobile_flutter/data/models/common/response_data.dart';
import 'package:animus_mobile_flutter/data/models/anime/top_anime_dto.dart';

abstract class AnimeRepository {

  Future<ResultApi<ResponseData<List<AnimeDto>>>> getTopAnime();

  Future<ResultApi<ResponseData<AnimeDto>>> getAnimeById(int id);
}