import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SearchBar(
        hintText: 'Search movies...',
        onChanged: (query) {
          Provider.of<MovieProvider>(context, listen: false)
              .searchMovies(query);
        },
        leading: const Icon(Icons.search),
      ),
    );
  }
}
