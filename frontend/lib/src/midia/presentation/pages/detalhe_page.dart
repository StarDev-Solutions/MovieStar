import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moviestar/src/base/data/mock/mock_data.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/utils/formatter.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/midia/presentation/controllers/midia_controller.dart';
import 'package:moviestar/src/midia/presentation/pages/widgets/box_elenco.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late MidiaController _midiaController;
  late Midia _midiaSelecionada;

  @override
  void initState() {
    _midiaController = Get.find<MidiaController>();
    _midiaSelecionada = _midiaController.midiaSelecionada!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                height: constraints.maxHeight * 0.6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: MemoryImage(
                      Formatter.imagemBase64(_midiaSelecionada.cartaz)!,
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorBackground.withValues(alpha: 0.4),
                        colorBackground.withValues(alpha: 0.7),
                        colorBackground.withValues(alpha: 0.95),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: Theme.of(context).rowSize * 1.2),
                  UIPadding(
                    useHorizontalPadding: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 15.s,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: _midiaSelecionada.id,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  height: 250.s2,
                                  Formatter.imagemBase64(_midiaSelecionada.cartaz)!,
                                ),
                              ),
                            ),
                            Row(
                              spacing: 10.s,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  spacing: 2.s,
                                  children: [
                                    Icon(Icons.calendar_month, size: 21.s, color: colorHint),
                                    UIText.dataLancamento('${_midiaSelecionada.dataLancamento.year}'),
                                  ],
                                ),
                                UIText.dataLancamento('|'),
                                Row(
                                  spacing: 2.s,
                                  children: [
                                    Icon(Icons.access_time_filled_sharp, size: 21.s, color: colorHint),
                                    UIText.dataLancamento('144 minutos'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15.s),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: UIText.tituloMedia(_midiaSelecionada.titulo)),
                            Column(
                              spacing: 4.s,
                              children: [
                                RatingBarIndicator(
                                  rating: _midiaSelecionada.nota.toDouble(),
                                  itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
                                  itemCount: 5,
                                  itemSize: 18.s,
                                ),
                                UIText.labelUsuarios('Por 300 usuários')
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15.s),
                        UIText.sinopse(_midiaSelecionada.sinopse, maxLines: 5),
                        SizedBox(height: 15.s),
                        UIText.label('Elenco'),
                        SizedBox(height: 15.s),
                      ],
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      padding: getPaddingHorizontal(context),
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return BoxElenco(
                          imagem: base64,
                          nome: 'Andiamo Pirgoretti',
                          personagem: 'Morbius',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}