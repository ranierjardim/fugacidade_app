import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fugacidade/Fragments/PinSelectedFragment.dart';
import 'package:fugacidade/GlobalConfig.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FugaMapaFragment extends StatefulWidget {
  const FugaMapaFragment({Key? key}) : super(key: key);

  @override
  _FugaMapaFragmentState createState() => _FugaMapaFragmentState();
}

class _FugaMapaFragmentState extends State<FugaMapaFragment> {
  int _counter = 0;
  BitmapDescriptor myIcon = BitmapDescriptor.defaultMarker;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(48, 48)), 'assets/agulha.png')
        .then((onValue) {
      setState(() {
        myIcon = onValue;
      });
    });
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<Set<Marker>> generateMarkers(
      List<Map<String, dynamic>> markers) async {
    List<Marker> outputMarkers = <Marker>[];
    final Uint8List? markerIcon =
        await getBytesFromAsset('assets/agulha.png', (100 * appScale).toInt());
    for (var mark in markers) {
      outputMarkers.add(Marker(
          markerId: MarkerId(mark["id"]),
          infoWindow: InfoWindow(),
          //InfoWindow(title: mark["description"], snippet: "snip"),
          icon: BitmapDescriptor.fromBytes(markerIcon!),
          position: LatLng(mark["lat"], mark["lon"]),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              isDismissible: true,

              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    minChildSize: 0.3,
                    maxChildSize: 1,
                    expand: true,


                    builder: (_, controller) {
                      return PinSelectedFragment(controller: controller);
                    });
              },
            );
          }));
    }
    return outputMarkers.toSet();
  }

  @override
  build(BuildContext context) {
    List<Map<String, dynamic>> mark = [
      {
        "id": "fuga_nazare_paulista",
        "description": "Fuga'Cidade de Nazaré Paulista",
        "lat": -23.182375,
        "lon": -46.398248,
      },
      {
        "id": "fuga_joaquim_egidio",
        "description": "Fuga'Cidade de Joaquim Edídio",
        "lat": -22.888202,
        "lon": -46.937857,
      },
      {
        "id": "fuga_mairipora",
        "description": "Fuga'Cidade de Mairiporã",
        "lat": -23.321628,
        "lon": -46.584509,
      },
      {
        "id": "fuga_cajamar",
        "description": "Fuga'Cidade de Cajamar",
        "lat": -23.364829,
        "lon": -46.871835,
      },
      {
        "id": "fuga_santana_do_parnaiba",
        "description": "Fuga'Cidade de Santana do Parnaíba",
        "lat": -23.444756,
        "lon": -46.922580,
      },
      {
        "id": "fuga_sao_lourenco_da_serra",
        "description": "Fuga'Cidade de São Lourenço da Serra",
        "lat": -23.858627,
        "lon": -46.946850,
      },
      {
        "id": "fuga_juquitiba",
        "description": "Fuga'Cidade de Juquitiba",
        "lat": -23.931461,
        "lon": -47.070860,
      },
      {
        "id": "fuga_bertioga",
        "description": "Fuga'Cidade de Bertioga",
        "lat": -23.823192,
        "lon": -46.116438,
      },
      {
        "id": "fuga_guaruja",
        "description": "Fuga'Cidade de Guarujá",
        "lat": -23.987525,
        "lon": -46.269902,
      },
      {
        "id": "fuga_santa_isabel",
        "description": "Fuga'Cidade de Santa Isabel",
        "lat": -23.314220,
        "lon": -46.227396,
      }
    ];
    //-23.314220, -46.227396
    return Stack(
      children: [
        FutureBuilder(
          future: generateMarkers(mark),
          builder: (context, snapshot) => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-23.539298, -46.637665),
              zoom: 8,
            ),
            trafficEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: snapshot.data == null ? {} : snapshot.data as Set<Marker>,
            onMapCreated: (GoogleMapController controller) async {
              controller.setMapStyle(
                  await rootBundle.loadString("assets/maps/fuga_theme.json"));
            },
          ),
        ),
        Positioned(
            top: 10 * appScale,
            right: 10 * appScale,
            child: Container(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/maps/aspas.svg",
                    width: MediaQuery.of(context).size.width * 0.2 * appScale,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20 * appScale, 12 * appScale, 20 * appScale, 12 * appScale),
                      child: Image(
                        image: AssetImage("assets/person.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Página de filtro de teste'),
                            ElevatedButton(
                              child: const Text('Fechar'),
                              onPressed: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              tooltip: 'Filtros',
              child: const Icon(Icons.filter_alt, color: appSecondaryColor1,),
              backgroundColor: appPrimaryColor),
        ),
      ],
    );
  }
}

/*



FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 600,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        tooltip: 'Filtros',
        child: const Icon(Icons.filter_alt),
        backgroundColor: Color.fromRGBO(191, 249, 79, 1),
      ), */
