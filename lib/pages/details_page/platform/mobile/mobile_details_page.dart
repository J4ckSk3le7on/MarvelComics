import 'package:marvel_comics/core/controllers/details_page_controller.dart';
import 'package:marvel_comics/pages/details_page/widgets/details_widget.dart';
import 'package:marvel_comics/pages/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:sizer/sizer.dart';

class MobileDetailsPage extends StatefulWidget {
  final int comicId;

  const MobileDetailsPage({
    Key? key,
    required this.comicId
  }) : super(key: key);

  @override
  MobileDetailsPageState createState() => MobileDetailsPageState();
}

class MobileDetailsPageState extends StateMVC<MobileDetailsPage> {
  late DetailsPageController _controller;

  MobileDetailsPageState() : super(DetailsPageController()) {
    _controller = controller as DetailsPageController;
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.fetchData(id: widget.comicId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _controller.details == null ? 
        const Center(child: CircularProgressIndicator())
        : SizedBox(
          width: 100.w,
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                ImageWidget(
                  imageUrl: _controller.details!.thumbnail.path,
                ),
                const SizedBox(height: 20),
                DetailsWidget(title: 'Variants', data: _controller.details!.variants),
              ],
            ),
          ),
        ),
    );
  }

}
