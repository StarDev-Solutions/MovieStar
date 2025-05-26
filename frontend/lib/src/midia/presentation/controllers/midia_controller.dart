import 'package:get/get.dart';
import 'package:moviestar/src/midia/domain/entities/movie.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';

///TODO: Criar objeto de midia para substituir o de [Filme].
class MidiaController extends GetxController {
  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  final RxList<Filme> _filmesPopulares = <Filme>[].obs;
  List<Filme> get filmesPopulares => _filmesPopulares;
  
  final RxList<Filme> _seriesPopulares = <Filme>[].obs;
  List<Filme> get seriesPopulares => _seriesPopulares;

  Filme? _midiaSelecionada;
  Filme? get midiaSelecionada => _midiaSelecionada;
  
  void selecionarMidia(Filme midia) => _midiaSelecionada = midia;
}