import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Listing",
      home: Scaffold(
        appBar: AppBar(title: Text("Long list")),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("FAB clicked");
          },
          child: Icon(Icons.add),
          tooltip: "Add an item",
        ),
      )));
}

List<String> getElements() {
  var items = List<String>.generate(500, (mycounter) => "Item $mycounter");

  return items;
}

Widget getListView() {
  var listItems = getElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: (){
        showSnackbar(context,listItems[index]);
      }
    );
  });

  return listView;
}

void showSnackbar(BuildContext context, String item) {
  var snackbar = SnackBar(
      content: Text("You just pressed $item"),
      action: SnackBarAction(
        label: "Undo",
        onPressed:(){
          debugPrint("dummy undo for $item");
        }
      ),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}
