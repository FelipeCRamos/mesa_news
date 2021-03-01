import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mesa_news/core/auth.dart';
import 'package:mesa_news/modules/home_module/blocs/home_bloc.dart';
import 'package:mesa_news/modules/home_module/pages/home_page.dart';
import 'package:mesa_news/shared/repositories/heroku/news_repository_heroku.dart';
import 'package:mesa_news/shared/services/news_service.dart';

import 'blocs/home_bloc_events.dart';
import 'blocs/home_bloc_states.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        newsService: NewsService(
          newsRepository: NewsRepositoryHeroku(
            auth: GetIt.instance.get<Auth>(),
          ),
        ),
      )..add(HomeBlocEventInitialLoad()),
      child: HomeProviderPage(),
    );
  }
}

class HomeProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeBlocState>(
      listener: (BuildContext context, HomeBlocState state) {},
      builder: (BuildContext context, HomeBlocState state) {
        if (state is HomeBlocStateLoaded) {
          return HomePage(
            highlights: state.highlights,
            lastNews: state.articles,
            userHighlighted: state.highlightedArticles,
          );
        }
        return HomePage(initialLoading: true);
      },
    );
  }
}
