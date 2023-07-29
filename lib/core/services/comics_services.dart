import 'package:marvel_comics/core/models/comic_model.dart';
import 'package:marvel_comics/core/models/comics_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class _ComicsServices {
  final String _baseUrl = "developer.marvel.com";
  final String _comicsUrl = "v1/public/comics";

  Future<ComicsModel> getComics(int offset, String? name) async {
    Uri url = Uri.https(_baseUrl, _comicsUrl, {
      'apikey': dotenv.env['API_KEY'],
      'format': 'json',
      'offset': '$offset',
      'limit': '50',
      'title': name
    });
    var response = await http.get(url);
    final decodedResponse = ComicsModel.fromRawJson(response.body);
    return decodedResponse;
  }

  Future<ComicModel> getComicDetails(int id) async {
    Uri url = Uri.https(_baseUrl, '$_comicsUrl/$id', {
      'apikey': dotenv.env['API_KEY'],
      'format': 'json',
    });
    var response = await http.get(url);
    final decodedResponse = ComicModel.fromRawJson(response.body);
    return decodedResponse;
  }

}

final comicsServices = _ComicsServices();