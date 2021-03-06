import 'package:flutter/material.dart';

class SearchBarDelegate extends SearchDelegate<String>{
  Function showResultWidget;
  SearchBarDelegate({@required this.showResultWidget});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon:Icon(Icons.clear),
      onPressed: ()=>query = '',
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: ()=>close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child:this.showResultWidget(query)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}