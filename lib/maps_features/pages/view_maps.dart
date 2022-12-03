import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/maps_features/viewmodels/local_storage.dart';

class ViewMaps extends StatefulWidget {
  const ViewMaps({Key? key}) : super(key: key);

  @override
  State<ViewMaps> createState() => _ViewMapsState();
}

class _ViewMapsState extends State<ViewMaps> {
  late double? lat;
  late double? lng;

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-6.175370307972331, 106.82680774480104),
    zoom: 14.4746,
  );
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _marker = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      insetPadding: EdgeInsets.zero,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                onTap: (LatLng latlng) {
                  Marker marker = Marker(
                    markerId: const MarkerId('1'),
                    position: LatLng(latlng.latitude, latlng.longitude),
                  );
                  _marker.add(marker);
                  setState(() {
                    lat = latlng.latitude;
                    lng = latlng.longitude;
                  });
                },
                markers: _marker.toSet(),
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    await LocalStorage.setLat(lat);
                    await LocalStorage.setLng(lng);

                    await Navigator.popAndPushNamed(context, '/map');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(orangeColor),
                  ),
                  child: Text(
                    'SAVE',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
