import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      if(constraints.biggest.width<550){
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20, tileMode: TileMode.clamp),
            child: Drawer(
              backgroundColor: Colors.white.withOpacity(0.07),
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
                  ListTile(
                    title: const Texter(
                        "Color Finder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                    ),
                    onTap: cfOnTap(context),
                    hoverColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.1),
                    focusColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.3),
                    enabled: true,
                    selectedTileColor: Theme.of(context).secondaryHeaderColor.withOpacity(0.4),
                    selected: true,
                    leading: const Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                  ),
                  ListTile(
                    title: const Texter(
                      "Color Finder",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    onTap: cfOnTap(context),
                    hoverColor:Colors.deepPurpleAccent.withOpacity(0.1),
                    focusColor: Colors.deepPurpleAccent.withOpacity(0.3),
                    enabled: true,
                    selectedTileColor: Colors.deepPurpleAccent.withOpacity(0.3),
                    leading: const Icon(
                      Icons.navigate_before,
                      color: Colors.white,
                    ),
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
      Scaffold.of(context).isDrawerOpen
      ){
        Scaffold.of(context).closeDrawer();
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
