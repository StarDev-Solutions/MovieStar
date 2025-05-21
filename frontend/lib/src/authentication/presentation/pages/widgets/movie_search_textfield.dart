import 'package:flutter/material.dart';
import 'package:frontend/src/authentication/domain/entities/movie.dart';
import 'package:frontend/src/core/theme/ui_helpers/ui_helper.dart';

class MovieSearchTextField extends StatelessWidget {
  final FocusNode searchFocusNode;
  final List<Movie> movies;
  final void Function(Movie movie) selectSuggestion;

  const MovieSearchTextField({super.key, required this.searchFocusNode, required this.movies, required this.selectSuggestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2), // Espaço para o gradiente
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
            focusNode: searchFocusNode,
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
                return movies.where((movie) => movie.title.toLowerCase().contains(input.toLowerCase())).map((movie) {
                  return ListTile(
                      onTap: () => selectSuggestion(movie),
                      title: Text(movie.title),
                    );
                  });
              },
            ),
          );
        }
      ),
    );
  }
}
