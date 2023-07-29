import 'package:marvel_comics/core/controllers/home_page_controller.dart';
import 'package:marvel_comics/core/enums/enums.dart';
import 'package:marvel_comics/pages/details_page/details_page.dart';
import 'package:marvel_comics/pages/home_page/widgets/description_widget.dart';
import 'package:marvel_comics/pages/home_page/widgets/home_page_appbar.dart';
import 'package:marvel_comics/pages/widgets/image_widget.dart';
import 'package:marvel_comics/pages/home_page/widgets/paginate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends StateMVC<HomePage> {
  late HomePageController _controller;
  late HomeViewType viewType;
  late TextEditingController textController;
  late bool isSearching;

  HomePageState() : super(HomePageController()) {
    _controller = controller as HomePageController;
  }

  @override
  void initState() {
    super.initState();
    viewType = HomeViewType.list;
    textController = TextEditingController();
    isSearching = false;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.fetchData(refresh: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(
        changeView: (HomeViewType newViewType) { 
          setState(() => viewType = newViewType);
        },
        currentViewType: viewType,
        textController: textController,
        search: (text) {
          _controller.fetchData(refresh: true, name: text);
        },
        isSearching: isSearching,
        setSearch: (isSearchingText) {
          isSearching = isSearchingText;
        },
      ),
      body: _controller.list == null ? 
        const Center(child: CircularProgressIndicator())
        : PaginateWidget(
        viewType: viewType,
        loading: HomePageController().loading,
        error: HomePageController().error,
        onLoadMore: () async {
          if (_controller.offset < _controller.totalResults) {
            _controller.fetchData(refresh: false);
          }
        },
        onRefresh: () async {
          _controller.fetchData(refresh: true);
        },
        onError: () async {
          _controller.fetchData(refresh: true);
        },
        items: _controller.list?.map((result) {
          if (viewType == HomeViewType.grid) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(comicId: result.id),
                  ),
                );
              },
              child: Column(
                children: [
                  ImageWidget(
                    imageUrl: result.thumbnail.path,
                    viewType: viewType,
                  ),
                  DescriptionWidget(
                    name: result.title,
                    date: result.modified
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(comicId: result.id),
                  ),
                );
              },
              child: Row(
                children: [
                  ImageWidget(
                    imageUrl: result.thumbnail.path,
                    viewType: viewType,
                  ),
                  const SizedBox(width: 10),
                  DescriptionWidget(
                    name: result.title,
                    date: result.modified
                  )
                ],
              ),
            );
          }
        }).toList(),
      ),
    );
  }

}
