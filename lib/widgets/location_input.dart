import 'package:flutter/material.dart';
import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../helpers/location_helper.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;

  const LocationInput({Key? key, required this.onSelectPlace})
      : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewLocationUrl;

  void _showPreview(double lat, double long) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
        latitude: lat, longitude: long);

    setState(() {
      _previewLocationUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();

      _showPreview(locData.latitude!, locData.longitude!);

      widget.onSelectPlace(locData.latitude, locData.longitude);
    } catch (error) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (ctx) => const MapScreen(
                isSelecting: true,
              )),
    );

    if (selectedLocation == null) return;

    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
  }

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
            onPressed: _getCurrentUserLocation,
            icon: const Icon(Icons.location_on),
            label: Text(
              'Current Location',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          TextButton.icon(
            onPressed: _selectOnMap,
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
