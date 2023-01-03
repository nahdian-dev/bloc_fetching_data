import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice_fetching_api_bloc/data/models/jokes_model.dart';

class JokesProvider {
  Future<JokesModel> getRandomJokes() async {
    String url = "https://official-joke-api.appspot.com/random_joke";

    Map<String, dynamic> responseJSON;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseString = json.decode(response.body);
      responseJSON = responseString;
    } else {
      throw Exception();
    }

    return JokesModel.fromJson(responseJSON);
  }
}
