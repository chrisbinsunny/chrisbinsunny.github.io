
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sizes.dart';
import '../widgets/functions.dart';

import '../widgets/widgets.dart';

class AppBarCustom extends StatefulWidget {


  const AppBarCustom({super.key, required this.keys, required this.scrollController});
  final List<GlobalKey> keys;
  final ScrollController scrollController;


  @override
  AppBarCustomState createState() => AppBarCustomState();
}

class AppBarCustomState extends State<AppBarCustom> {


  final hovered=ValueNotifier<int>(-1), viewing=ValueNotifier<int>(0);
  @override
  void initState() {
    widget.scrollController.addListener(() {
      viewing.value= isVisibleNow(widget.keys)-1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


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
                                  viewing: viewing,
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
                                  viewing: viewing,

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
                                  viewing: viewing,

                                  count: 2
                              ),
                              AppBarButton(
                                  onTap: (){
                                    widget.scrollController.position
                                        .ensureVisible(
                                        widget.keys[3].currentContext!.findRenderObject()!,
                                        curve: Curves.easeInOut,

                                        duration: const Duration(seconds: 1),
                                        alignment: -0.7
                                    );
                                  },
                                  text: 'Social',
                                  hovered: hovered,
                                  viewing: viewing,

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

}






class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.onTap, required this.text, required this.hovered, required this.viewing, required this.count}) : super(key: key);

  final ValueNotifier<int> hovered, viewing;
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
            ValueListenableBuilder<int>(
              valueListenable: viewing,
              builder: (context, view, child) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: ((hovered.value==count)||(view==count))?30:0,
                  curve: Curves.easeIn,
                  width:((hovered.value==count)||(view==count))?100:0,
                  decoration: BoxDecoration(
                      gradient: hovered.value==count?LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).secondaryHeaderColor
                        ],
                        stops: [
                          0,
                          0.8
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      ):null,
                      borderRadius: BorderRadius.circular(
                          20
                      ),
                      border: ((view==count)&&(hovered.value!=count))?Border.all(
                          color: Colors.white,
                          width: 1
                      ):null
                  ),
                );
              },),
            SizedBox(
              width: 100,
              child: Texter(
                text,
                select: false,
                textAlign: TextAlign.center,

                style: TextStyle(
                    color: (hovered.value==count)
                        ? Colors.white
                        : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 8,
                      blurRadius: 7
                    )
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
