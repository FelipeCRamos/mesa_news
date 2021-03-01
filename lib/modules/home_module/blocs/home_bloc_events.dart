import 'package:flutter/foundation.dart';
import 'package:mesa_news/shared/models/article_model.dart';

abstract class HomeBlocEvent {}

class HomeBlocEventInitialLoad implements HomeBlocEvent {}

class HomeBlocEventLoadMore implements HomeBlocEvent {}

class HomeBlocEventHighlight implements HomeBlocEvent {
  const HomeBlocEventHighlight({@required this.article});

  final ArticleModel article;
}

class HomeBlocEventOpen implements HomeBlocEvent {}
