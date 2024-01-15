import 'package:alabs_flutter_core/core/data/models/result_api.dart';
import 'package:alabs_flutter_core/core/domain/usecase/usecase.dart';
import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';
import 'package:animus_mobile_flutter/domain/repository/anime_repository.dart';

class GetAnimeByIdUseCase extends LaunchUseCaseWithParam<int, AnimeDvo> {

  GetAnimeByIdUseCase(this._repository);

  final AnimeRepository _repository;

  @override
  Future<ResultApi<AnimeDvo>> call(int param) async {
    final result = await _repository.getAnimeById(param);

    return launchMap(result, AnimeDvo.map(result.data?.data));
  }

}