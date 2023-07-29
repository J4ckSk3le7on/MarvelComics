import 'package:marvel_comics/core/models/comic_model.dart';
import 'package:marvel_comics/core/services/comics_services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DetailsPageController extends ControllerMVC {
  ComicResult? details;
  late bool error = false;
  late bool loading = false;

  Future<void> fetchData({
    required int id,
    bool loading = true,
  }) async {
    setState(() => error = false);
    if (loading) {
      setState(() => loading = true);
    }
    await comicsServices.getComicDetails(id).then((ComicModel result) {
      details = result.data.results.first;
    }).whenComplete(() {
      setState(() => loading = false);
    });
  }

}