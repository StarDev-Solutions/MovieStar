import 'package:flutter/material.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UIPadding(
        useVerticalPadding: true,
        useHorizontalPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: colorSecondary),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimary.withValues(alpha: 0.4),
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: const Offset(-3, -3),
                  ),
                  BoxShadow(
                    color: colorSecondary.withValues(alpha: 0.4),
                    blurRadius: 14,
                    spreadRadius: 1,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50.s2,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: colorBottomNavBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: colorPrimary,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.s),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDataContainer(label: 'Assistidos', statistic: '444h'),
                _buildDataContainer(label: 'Filmes', statistic: '200'),
                _buildDataContainer(label: 'Episódios', statistic: '112'),
              ],
            ),
            SizedBox(height: 30.s),
            UIText.label('Últimos avaliados'),
            SizedBox(height: 10),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 10),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => _buildCartaz(),
              ),
            ),
            SizedBox(height: 30.s),
          ],
        ),
      ),
    );
  }

  Column _buildCartaz() {
    return Column(
      spacing: 7,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/placeholder_midia.png'),
            image: AssetImage('assets/images/placeholder_midia.png'),
            width: 100,
            fit: BoxFit.contain,
          ),
        ),
        Text('avaliação')
      ],
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