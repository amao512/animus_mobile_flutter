import 'package:alabs_flutter_core/core/ui/bloc/base_cubit.dart';
import 'package:animus_mobile_flutter/domain/usecases/get_top_anime_usecase.dart';
import 'package:animus_mobile_flutter/presentation/home/bloc/home_state.dart';

class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(this._getTopAnimeUseCase);

  final GetTopAnimeUseCase _getTopAnimeUseCase;

  init() async {
    await launch(
      _getTopAnimeUseCase(),
      onResult: (result) {
        emitResult(HomeState(topAnime: result));
      },
    );
  }
}
