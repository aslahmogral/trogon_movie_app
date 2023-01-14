import 'package:http/http.dart' as http;
import 'package:trojonmovieapp/model/cast_model.dart';

class CastServices {
  Future<List<CastModel>?> getCast(String index) async {
    try {
    var url =Uri.parse('https://api.tvmaze.com/shows/$index/cast');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CastModel> _model = castModelFromJson(response.body);
        print(_model);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
