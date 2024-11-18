import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isLoading = false;
  String _error = '';

  static const String _apiKey = 'aab63a5f';
  static const String _baseUrl = 'http://www.omdbapi.com/';

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      _movies = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?apikey=$_apiKey&s=${Uri.encodeComponent(query)}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          List<Movie> tempMovies = [];
          for (var movieData in data['Search']) {
            final detailResponse = await http.get(
              Uri.parse('$_baseUrl?apikey=$_apiKey&i=${movieData['imdbID']}'),
            );

            if (detailResponse.statusCode == 200) {
              final detailData = json.decode(detailResponse.body);
              if (detailData['Response'] == 'True') {
                tempMovies.add(Movie.fromJson(detailData));
              }
            }
          }
          _movies = tempMovies;
        } else {
          _error = data['Error'] ?? 'No results found';
        }
      } else {
        _error = 'Failed to fetch movies. Please try again.';
      }
    } catch (e) {
      _error =
          'An error occurred while searching. Please check your internet connection.';
    }

    _isLoading = false;
    notifyListeners();
  }
}
