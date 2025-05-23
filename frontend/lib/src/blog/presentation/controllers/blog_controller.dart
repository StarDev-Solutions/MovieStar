import 'package:moviestar/src/base/enums/notifier_state.dart';
import 'package:moviestar/src/blog/data/repositories/blog_repository.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  Rx<NotifierState> _state = Rx(NotifierState.initial);
  NotifierState get state => _state.value;

  RxList<BlogPost> _blogPosts = RxList([]);
  List<BlogPost> get blogPosts => _blogPosts;

  BlogPost? _selectedBlogPost;
  BlogPost? get selectedBlogPost => _selectedBlogPost;

  Future<String> getBlogPosts({required int pageNumber}) async {
    String? errorMessage;
    _state.value = NotifierState.loading;

    final result = await Get.find<BlogRepository>().getBlogPosts(pageNumber: pageNumber);
    result.fold((left) {
      _state.value = NotifierState.failure;
      errorMessage = left.message;
    }, (right) {
        _blogPosts.value = right;
        _state.value = NotifierState.loaded;
      },
    );
    
    return errorMessage ?? '';
  }
  
  void selectBlogPost(BlogPost blogPost) => _selectedBlogPost = blogPost;
}