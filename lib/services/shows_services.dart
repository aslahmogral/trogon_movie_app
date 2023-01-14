import 'package:http/http.dart' as http;
import 'package:trojonmovieapp/model/shows_model.dart';

class ShowServices {
  Future<List<ShowModel>?> getShows() async {
    try {
      var url = Uri.parse('https://api.tvmaze.com/shows');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ShowModel> _model = showModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
