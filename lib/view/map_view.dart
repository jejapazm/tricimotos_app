import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;

  const MapView({super.key, required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    CameraPosition kGooglePlex = CameraPosition(
      target: initialLocation,
      zoom: 14.4746,
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        compassEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: kGooglePlex,
        // onMapCreated: (GoogleMapController controller) {
        //   _controller.complete(controller);
        // },

        // TODO: Markers, polylines, cuando se mueve el mapa
      ),
    );
  }
}
