import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/onBoarding/on_boarding_controller.dart';
import '../../../services/colors.dart';
import '../../../services/text/texts.dart';
import '../../widgets/share/texts/styled_text.dart';


class OnBoardingPage extends StatefulWidget {
  final int position;
  final Map item;

  const OnBoardingPage({Key? key, required this.position, required this.item}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<OnBoardingController>(
      builder: (controller) {
        return Container(
            margin: EdgeInsets.only(
              right: 32,
              left: 32,
              bottom: height * .08,
            ),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      width: controller.currentPage == widget.item['id'] - 1 ? width * 0.6 : 0,
                      child: Image.asset(
                        widget.item['img'],
                        width:  width * 0.6,
                      ),
                      curve: Curves.easeOut,
                      duration: Duration(milliseconds: 500),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: StyledTextShow(widget.item['title'],
                          size: font24, direction: TextAlign.center, color: darkGrayText, bold: true),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        widget.item['des'],
                        style: textStyle(font16, blackText, height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
