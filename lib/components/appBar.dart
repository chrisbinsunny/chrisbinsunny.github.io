
import 'dart:developer';
import 'dart:ui';

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

  double opacity=0.1;

  final hovered=ValueNotifier<int>(-1);

  findOpacity(double pos){
    return (pos < screenHeight(context, mulBy: 0.1))
        ? ((pos > 0)? pos / screenHeight(context,):0)
        : 0.1;

  }

  @override
  Widget build(BuildContext context) {
    opacity = findOpacity(Provider.of<ScrollDetail>(context, listen: true).getPos);
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
                if(constraints.biggest.width<510){
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
                              InkWell(
                                onHover: (value) {
                                  if(value){
                                    hovered.value=0;
                                  }else{
                                    hovered.value=-1;
                                  }
                                },
                                onTap: (){
                                  int a=2, i=0;
                                  // check first if orange widget context is not null
                                  if (widget.keys[a].currentContext != null) {
                                    widget.scrollController.position.ensureVisible(
                                      widget.keys[a].currentContext!.findRenderObject()!,
                                      alignment: 0.0,
                                      duration: const Duration(milliseconds: 300),
                                    );
                                  } else {
                                    for(int i=1; i<=a;){
                                      log("i=$i");
                                      Scrollable.ensureVisible(
                                        widget.keys[i].currentContext!,
                                        alignment: 0.0,
                                        duration: Duration(milliseconds: 300),
                                      ).whenComplete(() => i++);
                                    }

                                  }
                                  // widget.scrollController.position
                                  //     .ensureVisible(
                                  //   widget.keys[2].currentContext!.findRenderObject()!,
                                  //   curve: Curves.easeInOut,
                                  //
                                  //   duration: Duration(seconds: 1),
                                  //   alignment: -0.7
                                  // );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Texter(
                                      'Home',
                                      style: TextStyle(
                                        color: ((hover==0)||
                                            ((ModalRoute.of(context)!.settings.name=="/color-finder/")||
                                                (ModalRoute.of(context)!.settings.name=="/color-finder")||
                                                (ModalRoute.of(context)!.settings.name=="/")
                                            ))
                                            ? Colors.blue[200]
                                            : Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      height: 2,
                                      curve: Curves.bounceIn,
                                      width: hover==0?80:0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    Visibility(
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      visible:
                                      ((ModalRoute.of(context)!.settings.name=="/color-finder/")||
                                          (ModalRoute.of(context)!.settings.name=="/color-finder")||
                                          (ModalRoute.of(context)!.settings.name=="/")
                                      ),
                                      child: Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth(context, mulBy: 0.05)),
                              InkWell(
                                onHover: (value) {
                                  if(value){
                                    hovered.value=1;
                                  }else{
                                    hovered.value=-1;
                                  }
                                },
                                onTap: gmOnTap(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Texter(
                                      'About',
                                      style: TextStyle(
                                        color: ((hover==1)||
                                            ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                                (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                            ))
                                            ? Colors.blue[200]
                                            : Colors.white,
                                          fontSize: 20,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      height: 2,
                                      curve: Curves.bounceIn,
                                      width: hover==1?100:0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    Visibility(
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      visible:
                                      ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                          (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                      ),
                                      child: Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth(context, mulBy: 0.05)),
                              InkWell(
                                onHover: (value) {
                                  if(value){
                                    hovered.value=1;
                                  }else{
                                    hovered.value=-1;
                                  }
                                },
                                onTap: gmOnTap(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Texter(
                                      'Projects',
                                      style: TextStyle(
                                          color: ((hover==1)||
                                              ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                                  (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                              ))
                                              ? Colors.blue[200]
                                              : Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      height: 2,
                                      curve: Curves.bounceIn,
                                      width: hover==1?100:0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    Visibility(
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      visible:
                                      ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                          (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                      ),
                                      child: Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth(context, mulBy: 0.05)),
                              InkWell(
                                onHover: (value) {
                                  if(value){
                                    hovered.value=1;
                                  }else{
                                    hovered.value=-1;
                                  }
                                },
                                onTap: gmOnTap(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Texter(
                                      'Social',
                                      style: TextStyle(
                                          color: ((hover==1)||
                                              ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                                  (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                              ))
                                              ? Colors.blue[200]
                                              : Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 100),
                                      height: 2,
                                      curve: Curves.bounceIn,
                                      width: hover==1?100:0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    Visibility(
                                      maintainAnimation: true,
                                      maintainState: true,
                                      maintainSize: true,
                                      visible:
                                      ((ModalRoute.of(context)!.settings.name=="/gradient-maker/")||
                                          (ModalRoute.of(context)!.settings.name=="/gradient-maker")
                                      ),
                                      child: Container(
                                        height: 2,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: screenWidth(context, mulBy: 0.05)),

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