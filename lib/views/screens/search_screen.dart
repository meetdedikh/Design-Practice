import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        body: const Center(
          child: Text('Search Screen'),
        ));
  }
}
