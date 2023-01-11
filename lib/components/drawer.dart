import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/nothing.dart';
import '../widgets/widgets.dart';
import '../widgets/functions.dart';

class CustomEndDrawer extends StatefulWidget {
  const CustomEndDrawer({Key? key, required this.keys, required this.scrollController}): super(key: key);
  final List<GlobalKey> keys;
  final ScrollController scrollController;

  @override
  State<CustomEndDrawer> createState() => _CustomEndDrawerState();
}

class _CustomEndDrawerState extends State<CustomEndDrawer> {

  final hovered=ValueNotifier<int>(-1), viewing=ValueNotifier<int>(0);
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      viewing.value= isVisibleNow(widget.keys)-1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
              child: ValueListenableBuilder(
                valueListenable: viewing,
                builder: (context, value, child) {
                  return Column(
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
                        viewing: value,
                        count: 0,
                        onTap: (){
                          widget.scrollController.position
                              .ensureVisible(
                              widget.keys[0].currentContext!.findRenderObject()!,
                              curve: Curves.easeInOut,

                              duration: const Duration(seconds: 1),
                              alignment: -0.2
                          );
                        },
                        text: 'Home',
                      ),
                      AppBarButton(
                        viewing: value,
                        count: 1,

                        onTap: (){
                          widget.scrollController.position
                              .ensureVisible(
                              widget.keys[1].currentContext!.findRenderObject()!,
                              curve: Curves.easeInOut,

                              duration: const Duration(seconds: 1),
                              alignment: -0.2
                          );
                        },
                        text: 'About',
                      ),
                      AppBarButton(
                        viewing: value,
                        count: 2,

                        onTap: (){
                          widget.scrollController.position
                              .ensureVisible(
                              widget.keys[2].currentContext!.findRenderObject()!,
                              curve: Curves.easeInOut,

                              duration: const Duration(seconds: 1),
                              alignment: -0.2
                          );
                        },
                        text: 'Projects',
                      ),
                      AppBarButton(
                        viewing: value,
                        count: 3,

                        onTap: (){
                          widget.scrollController.position
                              .ensureVisible(
                              widget.keys[3].currentContext!.findRenderObject()!,
                              curve: Curves.easeInOut,

                              duration: const Duration(seconds: 1),
                              alignment: -0.2
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
                  );
                },
              ),
            ),
          ),
        );
      }
      if(
      Scaffold.of(context).isEndDrawerOpen
      ){
        Timer(Duration.zero, () {
          Scaffold.of(context).closeEndDrawer();

        },);
      }
      return const Nothing();
    },
    );
  }
}


class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key, required this.onTap, required this.text, required this.viewing, required this.count}) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final int count, viewing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Texter(
        text,
        select: false,
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
      selected: viewing==count,
      leading: const Icon(
        Icons.navigate_before,
        color: Colors.white,
      ),
    );
  }
}
