import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fugacidade/GlobalConfig.dart';
import 'package:fugacidade/Screens/EndScreen.dart';
import 'package:fugacidade/Widgets/FugaDateTimePicker.dart';
import 'package:fugacidade/Widgets/FugaSwitch.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PinSelectedFragment extends StatefulWidget {
  final ScrollController controller;

  const PinSelectedFragment({Key? key, required this.controller})
      : super(key: key);

  @override
  _PinSelectedFragmentState createState() =>
      _PinSelectedFragmentState(controller);
}

class _PinSelectedFragmentState extends State<PinSelectedFragment> {
  final ScrollController controller;

  _PinSelectedFragmentState(this.controller);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        Container(
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FugaDateTimePicker(
                    text: "check-in",
                    scale: appScale,
                  ),
                  FugaDateTimePicker(
                    text: "check-out",
                    scale: appScale,
                  ),
                  FugaSwitch(
                    borderSize: 14,
                    scale: appScale,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.width * 0.50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 12, 0),
                      child: Image(
                        image: AssetImage(
                            "assets/images/PinSelectedFragment/4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.width * 0.50,
                    color: appPrimaryColor,
                    child: Column(
                      children: [
                        Spacer(
                          flex: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14 * appScale,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14 * appScale,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14 * appScale,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14 * appScale,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 14 * appScale,
                            )
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          "4,93",
                          style: TextStyle(
                              fontSize: 30 * appScale,
                              color: appSecondaryColor,
                              fontFamily: "Raleway",
                              fontWeight: FontWeight.w900),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Container(
                          height: 58,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                                      child: Text("como chegar",
                                          style: TextStyle(
                                              fontSize: 12 * appScale)),
                                    ),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: StadiumBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/PinSelectedFragment/pin.png"),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 6,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GalleryExampleItemThumbnail(
                          galleryExampleItem: galleryItems[0],
                          onTap: () {
                            open(context, 0);
                          },
                        ),
                        Container(
                          width: 10,
                        ),
                        GalleryExampleItemThumbnail(
                          galleryExampleItem: galleryItems[1],
                          onTap: () {
                            open(context, 1);
                          },
                        ),
                        Container(
                          width: 10,
                        ),
                        GalleryExampleItemThumbnail(
                          galleryExampleItem: galleryItems[2],
                          onTap: () {
                            open(context, 2);
                          },
                        ),
                        Container(
                          width: 10,
                        ),
                        GalleryExampleItemThumbnail(
                          galleryExampleItem: galleryItems[3],
                          onTap: () {
                            open(context, 3);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 40,
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    color: Colors.white,
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.6 - 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3 + 40,
                      height: 40,
                      alignment: Alignment.bottomLeft,
                      decoration: new BoxDecoration(
                          color: appHelperColor2,
                          borderRadius: new BorderRadius.horizontal(
                              left: Radius.circular(30))),
                      child: Center(
                        widthFactor: 2 * appScale,
                        heightFactor: 3.4 * appScale,
                        child: Text(
                          "SERVIÇOS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Raleway"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.3 - 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3 + 40,
                      height: 40,
                      alignment: Alignment.bottomLeft,
                      decoration: new BoxDecoration(
                          color: appSecondaryColor,
                          borderRadius: new BorderRadius.horizontal(
                              left: Radius.circular(30))),
                      child: Center(
                        widthFactor: 1.5 * appScale,
                        heightFactor: 3.4 * appScale,
                        child: Text(
                          "ESPECIFICAÇÕES",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Raleway"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 40,
                      alignment: Alignment.bottomLeft,
                      decoration: new BoxDecoration(
                          color: appSecondaryColor2,
                          borderRadius: new BorderRadius.horizontal(
                              left: Radius.circular(30))),
                      child: Center(
                        widthFactor: 2 * appScale,
                        heightFactor: 3.4 * appScale,
                        child: Text(
                          "REVIEWS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Raleway"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300 * appScale,
                color: appSecondaryColor,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30 * appScale),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/PinSelectedFragment/bus.png"),
                                fit: BoxFit.fill,
                                height: 40 * appScale,
                                width: 40 * appScale,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FugaSwitch(
                                    borderSize: 0,
                                    scale: 0.7 * appScale,
                                    switchColor: appHelperColor2,
                                    hasShadow: false,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/PinSelectedFragment/shop.png"),
                                fit: BoxFit.fill,
                                height: 40 * appScale,
                                width: 40 * appScale,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FugaSwitch(
                                    borderSize: 0,
                                    scale: 0.7 * appScale,
                                    switchColor: appHelperColor2,
                                    hasShadow: false,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/PinSelectedFragment/dinner.png"),
                                fit: BoxFit.fill,
                                height: 40 * appScale,
                                width: 40 * appScale,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FugaSwitch(
                                    borderSize: 0,
                                    scale: 0.7 * appScale,
                                    switchColor: appHelperColor2,
                                    hasShadow: false,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/PinSelectedFragment/bike.png"),
                                fit: BoxFit.fill,
                                height: 40 * appScale,
                                width: 40 * appScale,
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: FugaSwitch(
                                    borderSize: 0,
                                    scale: 0.7 * appScale,
                                    switchColor: appHelperColor2,
                                    hasShadow: false,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 30 * appScale, 30 * appScale, 30 * appScale),
                        child: Text(
                          "SERVIÇOS  DISPONÍVEIS PARA MODELO DE HOSPEDAGEM ÚNICO que atende desde o hóspede que quer todos os serviços de pousada clássicos, até o cliente que quer autonomia total.",
                          style: TextStyle(
                              color: appSecondaryColor3,
                              fontSize: 18 * appScale),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: appPrimaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EndScreen()),
                          );
                        },
                        child: Text("RESERVAR AGORA"),
                        shape: StadiumBorder(),
                      ),
                      MaterialButton(
                        color: appPrimaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("VOLTAR AO MAPA"),
                        shape: StadiumBorder(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          galleryItems: galleryItems,
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
    GalleryExampleItem(
      id: "tag1",
      resource: "assets/images/PinSelectedFragment/3.jpg",
    ),
    GalleryExampleItem(
      id: "tag3",
      resource: "assets/images/PinSelectedFragment/1.jpg",
    ),
    GalleryExampleItem(
        id: "tag2",
        resource: "assets/images/PinSelectedFragment/6.jpg",
        isSvg: false),
    GalleryExampleItem(
      id: "tag4",
      resource: "assets/images/PinSelectedFragment/7.jpg",
    ),
  ];
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryExampleItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      tooltip: 'Voltar',
                      child: const Icon(
                        Icons.arrow_back,
                        color: appSecondaryColor1,
                      ),
                      backgroundColor: appPrimaryColor)),
            ),
          ],
        ),
      ),
    ));
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryExampleItem item = widget.galleryItems[index];
    return item.isSvg
        ? PhotoViewGalleryPageOptions.customChild(
            child: Container(
              width: 300,
              height: 300,
              child: SvgPicture.asset(
                item.resource,
                height: 200.0,
              ),
            ),
            childSize: const Size(300, 300),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: AssetImage(item.resource),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          );
  }
}

class GalleryExampleItem {
  GalleryExampleItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}
