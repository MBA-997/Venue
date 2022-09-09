import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewLocationUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewLocationUrl == null
              ? const Text(
                  'No Location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewLocationUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
            label: Text(
              'Current Location',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.map),
            label: Text(
              'Select on Map',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          )
        ])
      ],
    );
  }
}
