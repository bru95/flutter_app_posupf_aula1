import 'package:flutter/material.dart';

void main() {
  runApp(
    Home()
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<bool> chipsState = [false, false, false, false, false, false];
  List<String> chipsLabels = ["Android Nativo", "IOS Nativo", "Flutter", "React Native", "PWA", "Ionic"];
  List<String> itensDescriptions = ["Linguagens C, Java e Kotlin", "Linguagens Objective-c e Swift", "Linguagens Dart", "Linguagens Javascript e TypeScript", "Linguagens Javascript e TypeScript", "Linguagens Javascript e TypeScript"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Minhas Linguagens"),
          ),
          body: Column (
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
                    buildChipItem(0),
                    buildChipItem(1),
                    buildChipItem(2),
                    buildChipItem(3),
                    buildChipItem(4),
                    buildChipItem(5)
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: buildListView(),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget buildChipItem(int index) {
    return ChoiceChip(
      label: Text(chipsLabels[index]),
      selected: chipsState[index],
      onSelected: (checked) {
        setState(() {
          chipsState[index] = checked;
        });
      },
    );
  }

  List<Widget> buildListView() {
    return [
      if(chipsState[0]) buildItemList(0),
      if(chipsState[1]) buildItemList(1),
      if(chipsState[2]) buildItemList(2),
      if(chipsState[3]) buildItemList(3),
      if(chipsState[4]) buildItemList(4),
      if(chipsState[5]) buildItemList(5),
    ];
  }

  Widget buildItemList(int index) => Card(
    child: ListTile(
      title: Text(chipsLabels[index]),
      subtitle: Text(itensDescriptions[index]),
      leading: Icon(Icons.developer_mode),
    ),
  );
}

