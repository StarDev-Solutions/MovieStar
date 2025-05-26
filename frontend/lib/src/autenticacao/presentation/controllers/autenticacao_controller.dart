import 'package:get/get.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';

class AutenticacaoController extends GetxController {
  final Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  ///TODO: Criar objeto usuario para ser gerenciado.
  final Rx<String?> _usuario = Rx('');
  String? get usuario => _usuario.value;
}