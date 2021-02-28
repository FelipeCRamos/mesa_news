import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mesa_news/core/interpreters.dart';
import 'package:mesa_news/shared/models/article_model.dart';
import 'package:mesa_news/shared/widgets/solid_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    this.highlights = const <ArticleModel>[],
    this.lastNews = const <ArticleModel>[],
  }) : super(key: key);

  final List<ArticleModel> highlights;
  final List<ArticleModel> lastNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SolidAppBar(title: 'Mesa News', actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.white),
          onPressed: _openFilterPage,
        ),
      ]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          _highlightArea(context),
          _lastNewsArea(),
        ],
      ),
    );
  }

  Widget _highlightArea(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
          child: _sectionText('Destaques'),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: highlights
                  .map(
                      (ArticleModel model) => _highlightArticle(model, context))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sectionText(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _highlightArticle(ArticleModel model, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.85,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 140),
        child: Row(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 140),
              child: const Placeholder(color: Colors.red),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        model.title,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  _saveArticleWidget(model),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lastNewsArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 6),
          child: _sectionText('Últimas notícias'),
        ),
        ...lastNews.map((ArticleModel model) => _article(model)).toList(),
      ],
    );
  }

  Widget _article(ArticleModel model) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: <Widget>[
            const AspectRatio(
              aspectRatio: 6 / 2.2,
              child: Placeholder(
                color: Colors.brown,
              ),
            ),
            _saveArticleWidget(model, expanded: true),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                model.title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                model.description,
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Divider(
                color: Color(0xFFD3D3D3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveArticleWidget(ArticleModel model, {bool expanded = false}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment:
      // expanded ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.bookmark_outline,
            color: Color(0xFF010A53),
          ),
          onPressed: () {},
        ),
        Expanded(
          child: Text(
            Interpreters.timeDelta(model.publishedAt.toUtc()),
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              fontStyle: FontStyle.italic,
            ),
            textAlign: expanded ? TextAlign.right : TextAlign.start,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }

  void _openFilterPage() {}
}
