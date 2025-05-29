import 'package:flutter/material.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';

class BoxBuscaMidia extends StatefulWidget {
  final FocusNode searchFocusNode;
  final List<Midia> midia;
  final void Function(Midia midia) sugestaoSelecionada;

  const BoxBuscaMidia({
    super.key,
    required this.searchFocusNode,
    required this.midia,
    required this.sugestaoSelecionada,
  });

  @override
  State<BoxBuscaMidia> createState() => _BoxBuscaMidiaState();
}

class _BoxBuscaMidiaState extends State<BoxBuscaMidia> {

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [colorPrimary, colorSecondary],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withValues(alpha: 0.4),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(-3, -3),
            ),
            BoxShadow(
              color: colorSecondary.withValues(alpha: 0.4),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Focus(
              focusNode: widget.searchFocusNode,
              onFocusChange: (value) {
                if (value) {
                  widget.searchFocusNode.unfocus();
                }
              },
              child: SearchAnchor.bar(
                barBackgroundColor: WidgetStatePropertyAll(colorBackground),
                barShape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                viewShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                viewBackgroundColor: colorBackground,
                viewConstraints: BoxConstraints(maxWidth: constraints.maxWidth),
                isFullScreen: false,
                suggestionsBuilder: (context, controller) {
                  final String input = controller.value.text;
                  return widget.midia.where((movie) => movie.titulo.toLowerCase().contains(input.toLowerCase())).map((movie) {
                    return ListTile(
                        onTap: () => widget.sugestaoSelecionada(movie),
                        title: Text(movie.titulo),
                      );
                    });
                },
              ),
            );
          }
        ),
      ),
    );
  }
}
