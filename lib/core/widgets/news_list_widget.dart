import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/articles_list_widget.dart';
import 'package:news_app/core/widgets/tab_item_widget.dart';
import 'package:news_app/features/home/viewModel/category_view_model.dart';
import 'package:provider/provider.dart';

import '../../features/home/viewModel/article_view_model.dart';
import '../../models/source_model.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key, required this.sourcesList}) : super(key: key);
  final List<SourceModel> sourcesList;

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;
  var viewModel = ArticleViewModel();

  @override
  void initState() {
    viewModel.getArticlesData(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleViewModel>(
      create: (context) => viewModel,
      child: Consumer<ArticleViewModel>(builder: (context, viewModel, _) {
        return Column(
          children: [
            DefaultTabController(
                initialIndex: selectedIndex,
                length: widget.sourcesList.length,
                child: TabBar(
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                        viewModel.getArticlesData(
                            widget.sourcesList[selectedIndex].id);
                      });
                    },
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    indicator: const BoxDecoration(),
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    tabs: widget.sourcesList
                        .map(
                          (e) => TabItemWidget(
                            sourceModel: e,
                            isSelected:
                                selectedIndex == widget.sourcesList.indexOf(e),
                          ),
                        )
                        .toList())),
            ArticlesListWidget(
              sourceId: widget.sourcesList[selectedIndex].id,
            ),
          ],
        );
      }),
    );
  }
}
