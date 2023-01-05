

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:seo/html/seo_widget.dart';

class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {



    return Container(
      width: screenWidth(context, mulBy: 1),
      height: screenHeight(context),
      color: const Color(0xff0c0c0c),
      constraints:const BoxConstraints(
      minWidth: 500,
        minHeight:  725,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight(context, mulBy: 0.3),
                child: Imager(
                  altText: "QR code to get Chrisbin's contact vCard",
                  path:"images/qrCode.png",
                  imageFit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Texter("  Chrisbin Sunny",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Texter("   App Developer | Speaker",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200
                ),
              ),
              TextButton(
                  onPressed: (){},
                  child: Texter(
                      "(IND) +91 83300 70512",

                  ),
                style: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w200
    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
