import 'package:flutter/material.dart';

class VideoSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Video';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: const Center(
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 130,
          ),
        ),
      );
    }
    return Text('$query');
  }
}
