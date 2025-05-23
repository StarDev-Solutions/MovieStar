import 'package:equatable/equatable.dart';

class BlogPost extends Equatable {
  final String imagePath;
  final String title;
  final String excerpt;
  final String htmlContent;

  const BlogPost({required this.imagePath, required this.title, required this.excerpt, required this.htmlContent});
    
  @override
  List<Object?> get props => [imagePath, title, excerpt, htmlContent];
}