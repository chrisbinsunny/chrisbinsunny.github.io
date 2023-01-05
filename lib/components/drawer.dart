import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key, required this.keys, required this.scrollController}): super(key: key);
  final List<GlobalKey> keys;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        log("Drawer: ${constraints.maxWidth}");
      if(constraints.biggest.width<670){
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20, tileMode: TileMode.clamp),
            child: Drawer(
              backgroundColor: Colors.white.withOpacity(0.07),
              shape: const Border(
                left: BorderSide(
                  color: Color(0x18ffffff),
                  width: 0.5
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Texter(
                      'CHRISBIN',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 5,
                        ),
                  ),
                    ),

                  ),
                  AppBarButton(
                      onTap: (){
                        scrollController.position
                            .ensureVisible(
                            keys[0].currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,

                            duration: const Duration(seconds: 1),
                            alignment: -0.7
                        );
                      },
                      text: 'Home',
                  ),
                  AppBarButton(
                      onTap: (){
                        scrollController.position
                            .ensureVisible(
                            keys[1].currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,

                            duration: const Duration(seconds: 1),
                            alignment: -0.7
                        );
                      },
                      text: 'About',
                  ),
                  AppBarButton(
                      onTap: (){
                        scrollController.position
                            .ensureVisible(
                            keys[2].currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,

                            duration: const Duration(seconds: 1),
                            alignment: -0.7
                        );
                      },
                      text: 'Projects',
                  ),
                  AppBarButton(
                      onTap: (){
                        scrollController.position
                            .ensureVisible(
                            keys[2].currentContext!.findRenderObject()!,
                            curve: Curves.easeInOut,

                            duration: const Duration(seconds: 1),
                            alignment: -0.7
                        );
                      },
                      text: 'Social',
                  ),
                  const Spacer(),
                  Container(
                height: 50,
                    width: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        CupertinoIcons.xmark,
                        color: Colors.white,
                      ), onPressed: () {
                        Scaffold.of(context).closeEndDrawer();
                    },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if(
      Scaffold.of(context).isEndDrawerOpen
      ){
        Navigator.pop(context);
      }
      return const SizedBox();
    },
    );
  }



  VoidCallback? gmOnTap(BuildContext context){
    switch(ModalRoute.of(context)!.settings.name){
      case "/gradient-maker":
      case "/gradient-maker/":
        return null;
        break;
      case "/color-finder":
      case "/color-finder/":
      case "/":
        return (){
          Navigator.of(context).pushNamed("/gradient-maker");
        };
        break;
    }
    return null;
  }

  VoidCallback? cfOnTap(BuildContext context){
    switch(ModalRoute.of(context)!.settings.name){
      case "/gradient-maker":
      case "/gradient-maker/":
        return (){
          Navigator.of(context).pushNamed("/color-finder");
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


class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.onTap, required this.text,}) : super(key: key);

  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Texter(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 18
        ),
      ),
      onTap: onTap,
      hoverColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
      focusColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
      enabled: true,
      selectedTileColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.4),
      leading: const Icon(
        Icons.navigate_before,
        color: Colors.white,
      ),
    );
  }
}
