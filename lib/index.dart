


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/drawer.dart';
import 'package:portfolio/screens/about.dart';
import 'package:portfolio/screens/projects.dart';
import 'package:portfolio/screens/social.dart';
import 'screens/home.dart';
import 'sizes.dart';

import 'components/appBar.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {

  final ScrollController scrollController= ScrollController();
  late final bool isWebMobile;
  final List<GlobalKey> keys=[
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  // _scrollListener() {
  //   Provider.of<ScrollDetail>(context, listen: false).setPos(scrollController.position.pixels);
  // }

  @override
  void initState() {
    // scrollController.addListener(_scrollListener);
    isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth(context), 70),
        child: AppBarCustom(keys: keys, scrollController: scrollController,),
      ),
      extendBodyBehindAppBar: true,
      endDrawer: CustomEndDrawer(keys: keys, scrollController: scrollController,),
      body: Container(
        color: const Color(0xff0c0c0c),
        width: screenWidth(context),
        child: Scrollbar(
          controller: scrollController,
          thickness: isWebMobile?3:11,
          interactive: true,
          radius: Radius.circular(isWebMobile?10:0),
          trackVisibility: false,
          thumbVisibility: false,
          child: ScrollConfiguration(
            behavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Home(key: keys[0],),
                  // About(key: keys[1],),
                  // Projects(key: keys[2],),
                  Social(key: keys[3])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
