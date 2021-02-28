import 'package:flutter/material.dart';
import 'package:mesa_news/modules/home_module/pages/home_page.dart';
import 'package:mesa_news/shared/models/article_model.dart';

void main() {
  runApp(MesaApp());
}

class MesaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: const Color(0xFFE5E5E5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
        lastNews: <ArticleModel>[
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii esse eh um bem grande entao se prepara ai poq vou testar os limites dessa bagaca eh nois cuzao ihaaaaa prog na veiaaaa',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: false,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
        ],
        highlights: <ArticleModel>[
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: true,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii esse eh um bem grande entao se prepara ai poq vou testar os limites dessa bagaca eh nois cuzao ihaaaaa prog na veiaaaa',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: true,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: true,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
          ArticleModel(
            content: 'teste teste teste teste',
            url: 'url teste',
            publishedAt: DateTime.now().subtract(const Duration(hours: 15)),
            highlight: true,
            description: 'descricao teste t4este teste',
            imageUrl: 'httpsasjkdnakj',
            author: 'autor',
            title: 'TITULO Aquiiii',
          ),
        ],
      ),
    );
  }
}
