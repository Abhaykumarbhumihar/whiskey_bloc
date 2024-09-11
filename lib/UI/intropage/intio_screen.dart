import 'package:flutter/material.dart';

import '../../untils/local/preference.dart';
import '../../untils/local/screenUtils.dart';
import '../../untils/widget/network_image.dart';
class IntroScreen extends StatelessWidget {
  var title;
  var subtititle;
  var imag;

  IntroScreen({super.key, this.title, this.subtititle, this.imag});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: NetworkImageWidget(
                  imageUrl: imag, // Replace with your image URL
                  imageWidth: ScreenUtils.width(context),
                  imageHeight: ScreenUtils.height(context) * 0.6 -
                      ScreenUtils.height(context) * 0.08,
                  imageFitType: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 12.0, right: 12.0, top: 22),
                child: Text(
                  title,
                  style: TextStyle(
                    color: PreferenceManger().getTheme() == false
                        ? Colors.black
                        : Colors.white,
                    fontSize: width * 0.05,
                    fontFamily: "Poppins Medium",
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 4),
                child: Text(
                  subtititle,
                  style: TextStyle(
                    color: PreferenceManger().getTheme() == false
                        ? Colors.black
                        : Colors.white,
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins Light",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
