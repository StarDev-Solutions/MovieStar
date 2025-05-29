import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';
import 'package:moviestar/src/usuario/presentation/pages/widgets/box_cartaz_midia.dart';
import 'package:moviestar/src/usuario/presentation/pages/widgets/box_perfil_usuario.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: UIPadding(
          useVerticalPadding: true,
          // useHorizontalPadding: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIPadding(
                useHorizontalPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoxPerfilUsuario(base64Avatar: '', usuario: 'John Connor'),
                    SizedBox(height: 30.s),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDataContainer(
                          label: 'Assistidos',
                          statistic: '444h',
                        ),
                        _buildDataContainer(label: 'Filmes', statistic: '200'),
                        _buildDataContainer(
                          label: 'Episódios',
                          statistic: '112',
                        ),
                      ],
                    ),
                    SizedBox(height: 30.s),
                    UIText.label('Listas'),
                  ],
                ),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 150.s,
                child: Visibility(
                  visible: false,
                  replacement: Center(child: Lottie.asset('assets/lotties/empty.json')),
                  child: CarouselView(
                    itemExtent: 200,
                    children: [
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                      Image.asset(
                        'assets/images/placeholder_artigo.png',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.s),
              UIPadding(
                useHorizontalPadding: true,
                child: UIText.label('Filmes Favoritos'),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 147.s,
                child: ListView.separated(
                  padding: getPaddingHorizontal(context),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return BoxCartazMidia(cartaz: '');
                  },
                ),
              ),
              SizedBox(height: 20.s),
              UIPadding(
                useHorizontalPadding: true,
                child: UIText.label('Séries Favoritas'),
              ),
              SizedBox(height: 10.s),
              SizedBox(
                height: 147.s,
                child: ListView.separated(
                  padding: getPaddingHorizontal(context),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return BoxCartazMidia(cartaz: '');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildDataContainer({required String statistic, required String label}) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: colorSecondary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(statistic), Text(label)],
      ),
    );
  }
}