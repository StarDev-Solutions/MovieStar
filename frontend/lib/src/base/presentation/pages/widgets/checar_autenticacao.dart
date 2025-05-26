import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestar/src/autenticacao/presentation/controllers/autenticacao_controller.dart';
import 'package:moviestar/src/autenticacao/presentation/pages/autenticacao_page.dart';
import 'package:moviestar/src/base/domain/entities/enums/notifier_state.dart';
import 'package:moviestar/src/midia/presentation/pages/principal_page.dart';

class ChecarAutenticacao extends StatelessWidget {
  const ChecarAutenticacao({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AutenticacaoController>(
      builder: (autenticacaoController) {
        ///Gerencia oque deve fazer dependendo em que estado se encontra o auth(usuário).
        if (autenticacaoController.state == NotifierState.loading) {
          return _loading();
        } else if (autenticacaoController.usuario == null) {
          return const AutenticacaoPage();
        } else {
          return const PrincipalPage();
        }
      },
    );
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }
}
