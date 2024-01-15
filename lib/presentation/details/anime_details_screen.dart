import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:alabs_flutter_core/core/ui/bloc/core_bloc_consumer.dart';
import 'package:alabs_flutter_core/core/ui/bloc/state/base_state.dart';
import 'package:alabs_flutter_core/core/ui/state/widget_state.dart';
import 'package:animus_mobile_flutter/app/router/route_path.dart';
import 'package:animus_mobile_flutter/app/theme/colors.dart';
import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';
import 'package:animus_mobile_flutter/presentation/details/bloc/anime_details_cubit.dart';
import 'package:animus_mobile_flutter/presentation/globalFeature/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AnimeDetailsScreen extends StatefulWidget {
  AnimeDetailsScreen({super.key, required this.animeId});

  final int animeId;

  @override
  State<StatefulWidget> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends CoreWidgetState<AnimeDetailsScreen> {
  late final AnimeDetailsCubit _cubit;

  @override
  void initState() {
    _cubit = getIt.get();
    super.initState();
    postFrame(() => _cubit.init(widget.animeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(),
        body: CoreBlocConsumer<AnimeDetailsCubit, BaseState<AnimeDvo>>(
          builder: (context, state) {
            if (state.isLoaded()) {
              return _body(state.result!);
            }
          },
        ),
      ),
    );
  }

  Widget _body(AnimeDvo anime) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: NetworkImageWidget(
              url: anime.images.jpg.largeImageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            anime.titleEnglish,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Text(
                "${anime.year} ${anime.rating}",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            "${anime.episodes} Episodes",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          Text(
            anime.synopsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          _playButton(anime),
        ],
      ),
    );
  }

  Widget _playButton(AnimeDvo anime) {
    return InkWell(
      onTap: () {
        context.push(RoutePath.player, extra: anime.trailer.youtubeId);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 9,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primary,
        ),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "Play",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
