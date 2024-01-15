import 'package:alabs_flutter_core/core/di/inject_core.dart';
import 'package:alabs_flutter_core/core/ui/bloc/state/base_state.dart';
import 'package:alabs_flutter_core/core/ui/state/widget_state.dart';
import 'package:alabs_flutter_core/core/ui/bloc/core_bloc_consumer.dart';
import 'package:animus_mobile_flutter/app/router/route_path.dart';
import 'package:animus_mobile_flutter/app/theme/colors.dart';
import 'package:animus_mobile_flutter/domain/models/anime/top_anime_dvo.dart';
import 'package:animus_mobile_flutter/presentation/globalFeature/widgets/network_image_widget.dart';
import 'package:animus_mobile_flutter/presentation/home/bloc/home_cubit.dart';
import 'package:animus_mobile_flutter/presentation/home/bloc/home_state.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends CoreWidgetState<HomeScreen> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    _cubit = getIt.get();
    super.initState();
    postFrame(_cubit.init);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        body: SafeArea(
          child: CoreBlocConsumer<HomeCubit, BaseState<HomeState>>(
            builder: (context, state) {
              if (state.isLoaded()) {
                return _body(state.result!);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _body(HomeState state) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sliderWidget(state, constraints),
                  _topAnimeWidget(state, constraints),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sliderWidget(HomeState state, BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight * .6,
      child: CarouselSlider(
        items: state.topAnime
            .map(
              (e) => Stack(
                children: [
                  NetworkImageWidget(
                    url: e.images.jpg.largeImageUrl,
                    height: 600,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,
                          horizontal: 40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: const Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 0.9,
          initialPage: 1,
        ),
      ),
    );
  }

  Widget _topAnimeWidget(HomeState state, BoxConstraints constraints) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 280) / 2;
    final double itemWidth = size.width / 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            "Top Anime",
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 2.5,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: (itemWidth / itemHeight),
            mainAxisSpacing: 20,
            children: state.topAnime.map((e) {
              return _animeWidget(e);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _animeWidget(AnimeDvo anime) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          context.push(RoutePath.details, extra: anime.id);
        },
        child: SizedBox(
          height: 160,
          width: 103,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: NetworkImageWidget(
                  url: anime.images.jpg.imageUrl,
                  height: 147,
                  width: 103,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                anime.title,
                style: TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
