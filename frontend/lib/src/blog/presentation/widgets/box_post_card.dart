import 'package:flutter/material.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';

class BoxCardPost extends StatelessWidget {
  final BlogPost post;

  const BoxCardPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bottomNavBackgroundColor,
        borderRadius: BorderRadius.circular(20.s),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              post.imagePath,
              height: 200.s,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.contentTitle(post.title),
                UIText.excerpt(post.excerpt, maxLines: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
