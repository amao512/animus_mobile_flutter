import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';

class HomeState {
  HomeState({
    required this.topAnime,
  });

  final List<AnimeDvo> topAnime;
}
