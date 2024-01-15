import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:animus_mobile_flutter/domain/usecases/get_anime_by_id_usecase.dart';
import 'package:animus_mobile_flutter/domain/usecases/get_top_anime_usecase.dart';

injectUseCases() {
  getIt.registerFactory(() => GetTopAnimeUseCase(getIt.get()));
  getIt.registerFactory(() => GetAnimeByIdUseCase(getIt.get()));
}