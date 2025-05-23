import 'package:flutter/material.dart';
import 'package:moviestar/src/authentication/domain/entities/movie.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:intl/intl.dart';

class CustomCatalogTile extends StatelessWidget {
  final Movie movie;
  const CustomCatalogTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Hero(
            tag: movie.id,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_image.png',
              image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        UIText.contentTitle(movie.title, maxLines: 2, textAlign: TextAlign.center,),
        Text(formatDate(movie.releaseDate), style: releaseDateStyle, maxLines: 1),
      ],
    );
  }

  String formatDate(String date) {
    // initializeDateFormatting('pt_BR', null);
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
  }
}
