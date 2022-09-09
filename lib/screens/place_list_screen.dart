import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venue/providers/great_places.dart';

import '../screens/add_place_screen.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child:
            const Center(child: Text('Got no places yet, start adding some!')),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch as Widget
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {
                    //detail page
                  },
                ),
              ),
      ),
    );
  }
}
