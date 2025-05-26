import 'package:flutter/material.dart';
import 'package:moviestar/src/core/route.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviestar/src/midia/domain/entities/movie.dart';
import 'package:moviestar/src/midia/presentation/controllers/midia_controller.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/categoria_serie.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/catalogo_midia.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/categoria_filme.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/busca_midia.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> with SingleTickerProviderStateMixin {
  late CarouselController _carouselController;
  late FocusNode focusNode;
  late AnimationController _animationController;
  late CurvedAnimation _opacityAnimation;
  late Animation<Offset> _offsetTtoB;
  late Animation<Offset> _offsetLtoR;
  late Animation<Offset> _offsetRtoL;

  final MidiaController _mediaController = Get.find<MidiaController>();

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
        padding: EdgeInsets.only(top: 45.s),
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
                      child: BuscaMidia(
                        searchFocusNode: focusNode,
                        midia: Get.find<MidiaController>().filmesPopulares,
                        sugestaoSelecionada: selectMovie,
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
                    child: CategoriaFilme(),
                  ),
                  SlideTransition(
                    position: _offsetRtoL,
                    child: CategoriaSerie(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.s),
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Text('Populares', style: labelStyle),
                    ),
                  ),
                  SizedBox(height: 20),
                  GetBuilder<MidiaController>(
                    builder: (controller) {
                      return Skeletonizer(
                        enabled: controller.state == NotifierState.loading,
                        child: SizedBox(
                          height: 220.s,
                          child: CarouselView.weighted(
                            controller: _carouselController,
                            enableSplash: false,
                            onTap: (_) => Get.toNamed(Routes.detalheRoute),
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
                                    : controller.filmesPopulares.map((e) {
                                      return TweenAnimationBuilder<Offset>(
                                        duration: Duration(milliseconds: 600),
                                        tween: Tween(begin: Offset(1, 0), end: Offset.zero),
                                        builder: (context, value, child) {
                                          return Transform.translate(
                                            offset: value,
                                            child: CatalogoMidia(movie: e),
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

  void selectMovie(Filme movie) => _mediaController.selecionarMidia(movie);
}
