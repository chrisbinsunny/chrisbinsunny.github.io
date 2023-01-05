
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sizes.dart';
import '../widgets/widgets.dart';

class AppBarCustom extends StatefulWidget {


  const AppBarCustom({super.key, required this.keys, required this.scrollController});
  final List<GlobalKey> keys;
  final ScrollController scrollController;


  @override
  AppBarCustomState createState() => AppBarCustomState();
}

class AppBarCustomState extends State<AppBarCustom> {


  final hovered=ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {

    isVisibleNow(widget.keys[2]);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.clamp),
        child: Container(
          color: Colors.black.withOpacity(0.1), ///303030
          alignment: Alignment.centerLeft,
         // height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                ///Had to add a lesser width due to the padding of 40
                if(constraints.biggest.width<610){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Texter(
                        'CHRISBIN',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Color(0xff5dc8f8),
                            fontSize: 30,
                            fontFamily: "Gilroy",
                            letterSpacing: 3
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(Icons.menu, size: 22, color: Theme.of(context).primaryColor,),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Texter(
                      'CHRISBIN',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xff5dc8f8),
                          fontSize: 30,
                          fontFamily: "Gilroy",
                        letterSpacing: 3
                      ),
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: hovered,
                      builder: (context, hover, child) {
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Spacer(),
                              AppBarButton(
                                  onTap: (){
                                    widget.scrollController.position
                                        .ensureVisible(
                                        widget.keys[0].currentContext!.findRenderObject()!,
                                        curve: Curves.easeInOut,

                                        duration: const Duration(seconds: 1),
                                        alignment: -0.7
                                    );
                                  },
                                  text: 'Home',
                                  hovered: hovered,
                                  count: 0
                              ),
                              AppBarButton(
                                  onTap: (){
                                    widget.scrollController.position
                                        .ensureVisible(
                                        widget.keys[1].currentContext!.findRenderObject()!,
                                        curve: Curves.easeInOut,

                                        duration: const Duration(seconds: 1),
                                        alignment: -0.7
                                    );
                                  },
                                  text: 'About',
                                  hovered: hovered,
                                  count: 1
                              ),
                              AppBarButton(
                                  onTap: (){
                                    widget.scrollController.position
                                        .ensureVisible(
                                        widget.keys[2].currentContext!.findRenderObject()!,
                                        curve: Curves.easeInOut,

                                        duration: const Duration(seconds: 1),
                                        alignment: -0.7
                                    );
                                  },
                                  text: 'Projects',
                                  hovered: hovered,
                                  count: 2
                              ),
                              AppBarButton(
                                  onTap: (){
                                    widget.scrollController.position
                                        .ensureVisible(
                                        widget.keys[2].currentContext!.findRenderObject()!,
                                        curve: Curves.easeInOut,

                                        duration: const Duration(seconds: 1),
                                        alignment: -0.7
                                    );
                                  },
                                  text: 'Social',
                                  hovered: hovered,
                                  count: 3
                              ),
                            ],
                          ),
                        );
                      },)

                  ],
                );
              },

            )
          ),
        ),
      ),
    );
  }


  VoidCallback? gmOnTap(){
    switch(ModalRoute.of(context)!.settings.name){
      case "/gradient-maker":
      case "/gradient-maker/":
        return null;
        break;
      case "/color-finder":
      case "/color-finder/":
      case "/":
        return (){
          // Provider.of<AnalyticsService>(context, listen: false)
          //     .setCurrentScreen("Gradient Builder");
          // Navigator.of(context).pushNamed("/gradient-maker");
        };
        break;
    }
    return null;
  }

  VoidCallback? cfOnTap(){
    switch(ModalRoute.of(context)!.settings.name){
      case "/gradient-maker":
      case "/gradient-maker/":
      return (){
        // Provider.of<AnalyticsService>(context, listen: false)
        //     .setCurrentScreen("Color Finder");
        // Navigator.of(context).pushNamed("/color-finder");
      };
        break;
      case "/color-finder":
      case "/color-finder/":
      case "/":
      return null;

      break;
    }
    return null;
  }
}


class ScrollDetail extends ChangeNotifier{
  double scrollPosition = 0;
  ScrollController scrollController= ScrollController();



  double get getPos{
    return scrollPosition+0.1;
  }

  void setPos(double pos){
    scrollPosition= pos;
    notifyListeners();
  }

  ScrollController get getScrollController{
    return scrollController;
  }

  void setScrollController(double pos){
    scrollPosition= pos;
    notifyListeners();
  }
}

isVisibleNow(GlobalKey key){
  final RenderObject? box = key.currentContext?.findRenderObject(); //     !
  if (box != null) {
    final double yPosition = (box as RenderBox).localToGlobal(Offset.zero).dy; // !
    print('Widget is visible in the viewport at position: $yPosition');
    // do stuff...
  }
  else {
    print('Widget is not visible.');
    // do stuff...
  }
}


class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.onTap, required this.text, required this.hovered, required this.count}) : super(key: key);

  final ValueNotifier<int> hovered;
  final VoidCallback onTap;
  final int count;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth(context, mulBy: 0.02)),
      child: InkWell(
        onHover: (value) {
          if(value){
            hovered.value=count;
          }else{
            hovered.value=-1;
          }
        },
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 60),
              height: hovered.value==count?30:0,
              curve: Curves.easeIn,
              width:hovered.value==count?100:0,
              decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(4)
              ),
            ),
            SizedBox(
              width: 100,
              child: Texter(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: (hovered.value==count)
                        ? Colors.white
                        : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
