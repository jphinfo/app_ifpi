import 'package:app_working/utils/location_util.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();

    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maps"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Mapas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentUserLocation,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.location_on,
          color: Theme.of(context).secondaryHeaderColor,
          size: 35,
        ),
      ),
    );
  }
}
