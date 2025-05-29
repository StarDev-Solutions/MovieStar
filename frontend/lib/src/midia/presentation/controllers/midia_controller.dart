import 'package:get/get.dart';
import 'package:moviestar/src/midia/domain/entities/midia.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';

///TODO: Criar objeto de midia para substituir o de [Midia].
class MidiaController extends GetxController {
  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  final RxList<Midia> _filmesPopulares = <Midia>[].obs;
  List<Midia> get filmesPopulares => _filmesPopulares;
  
  final RxList<Midia> _seriesPopulares = <Midia>[].obs;
  List<Midia> get seriesPopulares => _seriesPopulares;

  Midia? _midiaSelecionada;
  Midia? get midiaSelecionada => _midiaSelecionada;
  
  void selecionarMidia(Midia midia) => _midiaSelecionada = midia;
}