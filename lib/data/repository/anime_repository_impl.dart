import 'package:alabs_flutter_core/core/data/models/result_api.dart';
import 'package:alabs_flutter_core/core/data/repository/base_repository.dart';
import 'package:animus_mobile_flutter/data/api/service/api_service.dart';
import 'package:animus_mobile_flutter/data/models/common/response_data.dart';
import 'package:animus_mobile_flutter/data/models/anime/top_anime_dto.dart';
import 'package:animus_mobile_flutter/domain/repository/anime_repository.dart';

class AnimeRepositoryImpl extends BaseRepository implements AnimeRepository {

  AnimeRepositoryImpl(this._service);

  final ApiService _service;

  @override
  Future<ResultApi<ResponseData<List<AnimeDto>>>> getTopAnime() {
    return call(_service.getTopAnime());
  }

  @override
  Future<ResultApi<ResponseData<AnimeDto>>> getAnimeById(int id) {
    return call(_service.getAnimeById(id));
  }
}