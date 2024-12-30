import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/models/service_model/service_model.dart';
import 'package:students/screens/dashboard/widgets/carousel_item.dart';
import 'package:students/utils/utils.dart';

class OurServiceWidget extends StatefulWidget {
  const OurServiceWidget({
    super.key,
    required this.serviceKey,
  });

  final GlobalKey serviceKey;

  @override
  State<OurServiceWidget> createState() => _OurServiceWidgetState();
}

class _OurServiceWidgetState extends State<OurServiceWidget> with Utils {
  static const carouselHeight = 400.0;
  late CarouselSliderController carouselController;

  List<ServiceModel> dummyData = <ServiceModel>[
    ServiceModel(
      image: Assets.dummyImage.spa1.path,
      name: 'Spa 1',
      price: 30000,
      duration: 20,
    ),
    ServiceModel(
      image: Assets.dummyImage.spa2.path,
      name: 'Spa 1',
      price: 30000,
      duration: 20,
    ),
    ServiceModel(
      image: Assets.dummyImage.spa3.path,
      name: 'Spa 1',
      price: 30000,
      duration: 20,
    ),
    ServiceModel(
      image: Assets.dummyImage.spa4.path,
      name: 'Spa 1',
      price: 30000,
      duration: 20,
    ),
    ServiceModel(
      image: Assets.dummyImage.spa6.path,
      name: 'Spa 1',
      price: 30000,
      duration: 20,
    ),
  ];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widget.serviceKey,
      child: Column(
        children: [
          Padding(
            padding: paddingVertical(context),
            child: RichText(
              text: TextSpan(style: AppTextStyle.extraLarge, children: [
                TextSpan(text: L10n.of(context).Services),
                TextSpan(
                  text: '\nTrải nghiệm bất tận tại Ngọt',
                  style: GoogleFonts.allison(),
                )
              ]),
              textAlign: TextAlign.center,
            ),
          ),
          CarouselSlider.builder(
            carouselController: carouselController,
            itemCount: dummyData.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CarouselItemWidget(
                serviceModel: dummyData.elementAt(index),
                carouselHeight: carouselHeight,
                carouselController: CarouselController(),
              );
            },
            options: CarouselOptions(
              height: carouselHeight,
              autoPlay: true,
              aspectRatio: 800 / 600,
              viewportFraction: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
