import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviestar/src/base/mock/mock_data.dart';
import 'package:moviestar/src/base/repositories/base_repository.dart';
import 'package:moviestar/src/blog/data/response/blog_post_response.dart';
import 'package:moviestar/src/blog/domain/entities/blog_post.dart';
import 'package:moviestar/src/blog/domain/repositories/iblog_repository.dart';
import 'package:moviestar/src/core/errors/failure.dart';
import 'package:get/get.dart';

class BlogRepository extends BaseRepository implements IBlogRepository {
  BlogRepository() {
    configureDio(Get.find<Dio>());
  }

  @override
  Future<Either<Failure, List<BlogPost>>> getBlogPosts({required int pageNumber}) async {
    try {
      final String url = '';
      // final response = await Get.find<Dio>().get(url);
      // final List<BlogPost> result = (response.data as List).map((json) => BlogPostResponse.fromJson(json)).toList(); 

      final List<BlogPost> result = (blogPosts['data'] as List).map((json) => BlogPostResponse.fromJson(json)).toList(); 
      return Right(result);
    } catch (error) {
      return Left(checkError(error));
    }
  }
}