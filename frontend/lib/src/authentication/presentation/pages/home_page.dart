import 'package:flutter/material.dart';
import 'package:moviestar/src/core/route.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviestar/src/authentication/domain/entities/movie.dart';
import 'package:moviestar/src/authentication/presentation/controllers/media_controller.dart';
import 'package:moviestar/src/authentication/presentation/pages/widgets/anime_category.dart';
import 'package:moviestar/src/authentication/presentation/pages/widgets/custom_catalog_tile.dart';
import 'package:moviestar/src/authentication/presentation/pages/widgets/movie_category.dart';
import 'package:moviestar/src/authentication/presentation/pages/widgets/movie_search_textfield.dart';
import 'package:moviestar/src/base/enums/notifier_state.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late CarouselController _carouselController;
  late FocusNode focusNode;
  late AnimationController _animationController;
  late CurvedAnimation _opacityAnimation;
  late Animation<Offset> _offsetTtoB;
  late Animation<Offset> _offsetLtoR;
  late Animation<Offset> _offsetRtoL;

  final MediaController _mediaController = Get.find<MediaController>();

  @override
  void initState() {
    _carouselController = CarouselController(initialItem: 1);
    focusNode = FocusNode();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _offsetTtoB = Tween(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetLtoR = Tween(begin: Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _offsetRtoL = Tween(begin: Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _mediaController.getTrendingMovies();
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.label('Pesquisar pelo título'),
                    SizedBox(height: 15.s),
                    SlideTransition(
                      position: _offsetTtoB,
                      child: MovieSearchTextField(
                        searchFocusNode: focusNode,
                        movies: Get.find<MediaController>().trendingMovies,
                        selectSuggestion: selectMovie,
                      ),
                    ),
                    SizedBox(height: 40),
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text('Categorias', style: labelStyle),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                spacing: 10,
                children: [
                  SlideTransition(
                    position: _offsetLtoR,
                    child: MovieCategory(),
                  ),
                  SlideTransition(
                    position: _offsetRtoL,
                    child: AnimeCategory(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text('Trending', style: labelStyle),
                    ),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<MediaController>(
                    builder: (controller) {
                      return Skeletonizer(
                        enabled: controller.state == NotifierState.loading,
                        child: SizedBox(
                          height: 220,
                          child: CarouselView.weighted(
                            controller: _carouselController,
                            enableSplash: false,
                            onTap: (_) => Get.toNamed(Routes.detailRoute),
                            flexWeights: [2, 3, 3, 2],
                            itemSnapping: true,
                            children:
                                controller.state == NotifierState.loading
                                    ? List.generate(
                                      4,
                                      (index) => Skeleton.leaf(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(14)
                                          ),
                                          width: 100,
                                        ),
                                      ),
                                    )
                                    : controller.trendingMovies.map((e) {
                                      return TweenAnimationBuilder<Offset>(
                                        duration: Duration(milliseconds: 600),
                                        tween: Tween(begin: Offset(1, 0), end: Offset.zero),
                                        builder: (context, value, child) {
                                          return Transform.translate(
                                            offset: value,
                                            child: CustomCatalogTile(movie: e),
                                          );
                                        }
                                      );
                                    }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectMovie(Movie movie) => _mediaController.selectMovie(movie);
}
