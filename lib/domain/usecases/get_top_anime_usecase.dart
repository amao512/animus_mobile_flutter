import 'package:alabs_flutter_core/core/data/models/result_api.dart';
import 'package:alabs_flutter_core/core/domain/usecase/usecase.dart';
import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';
import 'package:animus_mobile_flutter/domain/repository/anime_repository.dart';

class GetTopAnimeUseCase extends LaunchUseCase<List<AnimeDvo>> {
  GetTopAnimeUseCase(this._repository);

  final AnimeRepository _repository;

  @override
  Future<ResultApi<List<AnimeDvo>>> call() async {
    final result = await _repository.getTopAnime();

    return launchMap(
      result,
      result.data?.data?.map(AnimeDvo.map).toList() ?? [],
    );
  }
}
