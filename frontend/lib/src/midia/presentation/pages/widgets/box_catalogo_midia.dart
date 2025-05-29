import 'package:flutter/material.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:intl/intl.dart';

class BoxCatalogoMidia extends StatelessWidget {
  final Midia movie;
  const BoxCatalogoMidia({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Hero(
            tag: movie.id,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_midia.png',
              image: 'https://image.tmdb.org/t/p/w500${movie.cartaz}',
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
        UIText.contentTitle(
          movie.titulo,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        Text(dateTimeToDate(movie.dataLancamento), style: releaseDateStyle, maxLines: 1),
      ],
    );
  }

  String dateTimeToDate(DateTime date) {
    // initializeDateFormatting('pt_BR', null);
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
