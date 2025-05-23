import 'package:flutter/material.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/blog/presentation/controllers/blog_controller.dart';
import 'package:moviestar/src/blog/presentation/widgets/box_post_card.dart';
import 'package:moviestar/src/blog/presentation/widgets/post_search_textfield.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_responsivity.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:moviestar/src/base/enums/notifier_state.dart';
import 'package:moviestar/src/core/theme/ui_helpers/ui_helper.dart';
import 'package:get/get.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  late AnimationController _animationController;
  late CurvedAnimation _opacityAnimation;
  late Animation<Offset> _offsetTtoB;

  final BlogController _blogController = Get.find<BlogController>();

  @override
  void initState() {
    focusNode = FocusNode();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );
    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _offsetTtoB = Tween(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _blogController.getBlogPosts(pageNumber: 1);
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 45.s, left: 20.s, right: 20.s),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.label('Pesquisar pelo título'),
            SizedBox(height: 15.s),
            SlideTransition(
              position: _offsetTtoB,
              child: PostSearchTextfield(
                selectPost: selectPost,
              ),
            ),
            Obx(() {
                return Skeletonizer(
                  enabled: _blogController.state == NotifierState.loading,
                  child: Flexible(
                    child: ListView.separated(
                      padding: isMobile ? EdgeInsets.only(bottom: 100) : null,
                      separatorBuilder: (_, _) => SizedBox(height: 20),
                      itemCount: _blogController.blogPosts.length,
                      itemBuilder: (_, index) {
                        return BoxCardPost(post: _blogController.blogPosts[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void selectPost(BlogPost blogPost) => _blogController.selectBlogPost(blogPost);
}
