import 'dart:convert';
import 'package:http/http.dart' as http;

List latest = [];
List popular = [];
List toprated = [];
List upcoming = [];

final latestUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/now_playing?api_key=cbe53c92b7ca5adb0d70ed0f27fd9432');

final popularUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/popular?api_key=cbe53c92b7ca5adb0d70ed0f27fd9432');

final upComingUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/upcoming?api_key=cbe53c92b7ca5adb0d70ed0f27fd9432');

final topRatedUrl = Uri.parse(
    'https://api.themoviedb.org/3/movie/top_rated?api_key=cbe53c92b7ca5adb0d70ed0f27fd9432');

getLatest() async {
  final response = await http.get(latestUrl);
  Map data = json.decode(response.body);
  latest = data['results'];
  return latest;
}

getPopular() async {
  final response = await http.get(popularUrl);
  Map data = json.decode(response.body);
  popular = data['results'];
  return popular;
}

getUpComing() async {
  final response = await http.get(upComingUrl);
  Map data = json.decode(response.body);
  upcoming = data['results'];
  return upcoming;
}

getTopRated() async {
  final response = await http.get(topRatedUrl);
  Map data = json.decode(response.body);
  toprated = data['results'];
  return toprated;
}

List categories = [
  "Home",
  "My List",
  "Action",
  "Triller",
  "Horror",
  "Punjabi",
  "Bollywood",
  "Hollywood",
  "Mollywood",
  "Web Series",
];
