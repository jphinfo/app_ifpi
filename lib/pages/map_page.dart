import 'package:app_working/models/place_models.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageWiget extends StatefulWidget {
  const MapPageWiget({
    this.initialLocation = const PlaceLocation(
      latitude: -5.088812662690347,
      longitude: -42.81105129833007,
    ),
    this.isReadonly = false,
    Key? key,
  }) : super(key: key);

  final PlaceLocation? initialLocation;
  final bool isReadonly;

  @override
  State<MapPageWiget> createState() => _MapPageWigetState();
}

class _MapPageWigetState extends State<MapPageWiget> {
  GoogleMapController? mapController;

  String? info = InfoWindow.noText.title;

  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng? _pickedPosition;

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  final Set<Marker> _marcadores = {
    const Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088812662690347, -42.81105129833007),
      infoWindow: InfoWindow(title: "IFPI"),
    ),
    const Marker(
      markerId: MarkerId('IFPI-SUL'),
      position: LatLng(-5.101723, -42.813114),
      infoWindow: InfoWindow(title: "IFPI CENTRO SUL"),
    ),
    const Marker(
      markerId: MarkerId('Maria'),
      position: LatLng(-5.0824, -42.8241),
      infoWindow: InfoWindow(title: "Maria"),
    ),
    const Marker(
      markerId: MarkerId('José'),
      position: LatLng(-5.0855, -42.8198),
      infoWindow: InfoWindow(title: "José"),
    ),
    const Marker(
      markerId: MarkerId('Maria Bonita'),
      position: LatLng(-5.0869, -42.8058),
      infoWindow: InfoWindow(title: "Maria Bonita"),
    ),
    const Marker(
      markerId: MarkerId('Lampião'),
      position: LatLng(-5.0913, -42.8077),
      infoWindow: InfoWindow(title: "Lampião"),
    ),
  };

  // Set<Marker> marcadoresLocal = {};
  // _carregarMarcadores() {
  //   Marker marcadoIfpi = const Marker(
  //     markerId: MarkerId('IFPI'),
  //     position: LatLng(-5.088812662690347, -42.81105129833007),
  //     infoWindow: InfoWindow(
  //       title: "IFPI",
  //     ),
  //   );
  //   Marker marcadoIfpiSul = const Marker(
  //     markerId: MarkerId('IFPI-SUL'),
  //     position: LatLng(-5.101723, -42.813114),
  //   );
  //   marcadoresLocal.add(marcadoIfpi);
  //   marcadoresLocal.add(marcadoIfpiSul);
  //   setState(() {
  //     _marcadores = marcadoresLocal;
  //   });
  // }

  // @override
  // void initState() {
  //   _carregarMarcadores;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
        centerTitle: true,
        actions: [
          if (!widget.isReadonly)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _pickedPosition == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedPosition),
            )
        ],
      ),
      body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation!.latitude,
              widget.initialLocation!.longitude,
            ),
            zoom: 15.0,
          ),
          onTap: widget.isReadonly ? null : _selectPosition,
          mapToolbarEnabled: true,
          markers: _pickedPosition == null
              ? _marcadores
              : {
                  Marker(
                    markerId: const MarkerId('p1'),
                    position: _pickedPosition!,
                    //infoWindow: InfoWindow(title: info),
                  ),
                }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.location_on,
          color: Theme.of(context).secondaryHeaderColor,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
