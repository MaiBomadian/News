import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/tab_item_widget.dart';

import '../../models/source_model.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({Key? key, required this.sourcesList}) : super(key: key);
  final List<SourceModel> sourcesList;

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            initialIndex: selectedIndex,
            length: widget.sourcesList.length,
            child: TabBar(
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
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
                    .toList()))
      ],
    );
    ;
  }
}
