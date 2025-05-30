// import 'package:flutter/material.dart';
// import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
// import 'package:moviestar/src/core/utils/formatter.dart';

// class BoxElenco extends StatelessWidget {
//   final String imagem;
//   final String nome;
//   final String personagem;

//   const BoxElenco({
//     super.key,
//     required this.imagem,
//     required this.nome,
//     required this.personagem,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 300.s,
//       child: Stack(
//         children: [
//           Positioned(
//             left: 30.s,
//             child: Container(
//               padding: const EdgeInsets.all(2),
//               color: Color(0xff5E5E5E),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1C1C1E),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       nome,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     Text(
//                       'As $personagem',
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(2),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [colorPrimary, colorSecondary],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//               shape: BoxShape.circle,
//             ),
//             child: CircleAvatar(
//               radius: 32,
//               backgroundImage: MemoryImage(Formatter.imagemBase64(imagem)!),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
