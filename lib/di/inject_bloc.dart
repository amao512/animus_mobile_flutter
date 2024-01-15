import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:animus_mobile_flutter/presentation/details/bloc/anime_details_cubit.dart';
import 'package:animus_mobile_flutter/presentation/home/bloc/home_cubit.dart';

injectBloc() {
  getIt.registerFactory(() => HomeCubit(getIt.get()));
  getIt.registerFactory(() => AnimeDetailsCubit(getIt.get()));
}