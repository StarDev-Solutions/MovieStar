import 'package:equatable/equatable.dart';

class Midia extends Equatable {
  final int id;
  final String titulo;
  final String sinopse;
  final String cartaz;
  final DateTime dataLancamento;

  const Midia({
    required this.id,
    required this.titulo,
    required this.sinopse,
    required this.cartaz,
    required this.dataLancamento,
  });
  
  @override
  List<Object?> get props => [id, titulo, sinopse, cartaz, dataLancamento];
}
