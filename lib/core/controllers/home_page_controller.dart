import 'package:marvel_comics/core/models/comics_model.dart';
import 'package:marvel_comics/core/services/comics_services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePageController extends ControllerMVC {
  List<ComicsResults>? list;
  late bool error = false;
  late int offset = 0;
  late bool loading = false;
  late int totalResults = 0;

  Future<void> fetchData({
    required bool refresh,
    bool loading = true,
    String? name
  }) async {
    if (refresh) {
      setState(() => offset = 0);
      if (loading) list = null;
    }
    setState(() => error = false);
    if (loading) {
      setState(() => loading = true);
    }
    await comicsServices.getComics(offset, name).then((ComicsModel result) {
      if (offset == 0) {
        setState(() => list = result.data.results);
      } else {
        list?.addAll(result.data.results);
      }
      setState(() {
        offset = offset + 50;
        totalResults = result.data.offset;
      });
    }).catchError((error) {
      error = true;
    }).whenComplete(() {
      setState(() => loading = false);
    });
  }

}