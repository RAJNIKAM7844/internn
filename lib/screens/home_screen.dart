import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/movie_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Movie Search',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SearchBarWidget(),
          Expanded(child: MovieListWidget()),
        ],
      ),
    );
  }
}
