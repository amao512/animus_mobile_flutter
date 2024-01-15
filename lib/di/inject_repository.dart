import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:animus_mobile_flutter/data/repository/anime_repository_impl.dart';
import 'package:animus_mobile_flutter/domain/repository/anime_repository.dart';

injectRepository() {
  getIt.registerFactory<AnimeRepository>(
    () => AnimeRepositoryImpl(
      getIt.get(),
    ),
  );
}
