import 'package:alabs_flutter_core/core/ui/bloc/base_cubit.dart';
import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';
import 'package:animus_mobile_flutter/domain/usecases/get_anime_by_id_usecase.dart';

class AnimeDetailsCubit extends BaseCubit<AnimeDvo> {
  AnimeDetailsCubit(this._getAnimeByIdUseCase);

  final GetAnimeByIdUseCase _getAnimeByIdUseCase;

  init(int id) async {
    await launch(
      _getAnimeByIdUseCase(id),
      onResult: (result) {
        emitResult(result);
      },
    );
  }
}
