import 'package:flutter/material.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Latest extends StatelessWidget {
  const Latest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, mulBy: 1),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff0c0c0c),
                Color(0xff03253a),
                Color(0xff0c0c0c),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      constraints: BoxConstraints(
        minWidth: 500,
        minHeight: screenHeight(context),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, mulBy: 0.05),
          vertical: screenHeight(context, mulBy: 0.07)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Texter(
            "Latest",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          const SizedBox(
            height: 35,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 50,
            runSpacing: 40,
            children: [
              Container(
                width: 420,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 0.6),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x2dffffff), spreadRadius: 3, blurRadius: 15)
                    ]),
                child: const Imager(
                  path: "images/tethxr.jpg",
                  altText: "Tethxr, a social app for meeting people in the same physical space.",
                ),
              ),
              const LatestItem(
                title: "Tethxr",
                role: "Founder & Solo Developer",
                period: "Jul 2026 – Present",
                about: "Social app for meeting people in the same physical space (iOS, Android)",
                link: "https://tethxr.com",
                desc: "\u{25ca} Designed, built and launched the app solo from scratch; 500+ users in month one, 100+ active users and 350+ chats opened.\n"
                    "\u{25ca} Serverless, database-centric Supabase backend (SQL RPCs, Realtime, Auth, Edge Functions) with Firebase.\n"
                    "\u{25ca} Nearby-user detection over Wi-Fi, Bluetooth and GPS with opt-in visibility, never sharing exact location.\n"
                    "\u{25ca} Envelope-encrypted chat, decrypted in an iOS Notification Service Extension.\n"
                    "\u{25ca} Native iOS and Android cameras over Pigeon, making capture near-instant.\n"
                    "\u{25ca} Direct client uploads to AWS S3 through pre-signed URLs.\n"
                    "\u{25ca} Shipped 1.0 to 1.5.3 in 3 months with radar view, invites and age verification.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LatestItem extends StatelessWidget {
  const LatestItem({super.key, required this.title, required this.role, required this.period, required this.about, required this.desc, this.link});

  final String title, role, period, about, desc;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 480,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: const Color(0xff111111),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 0.6),
          boxShadow: const [
            BoxShadow(
                color: Color(0x2dffffff), spreadRadius: 3, blurRadius: 15)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Texter(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          Texter(
            role,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 19,
                color: Colors.white),
          ),
          Texter(
            period,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Theme.of(context).primaryColor),
          ),
          Container(
            height: 1.5,
            margin: const EdgeInsets.symmetric(vertical: 12),
            color: Theme.of(context).primaryColor,
          ),
          Texter(
            about,
            style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 16,
                color: Colors.white70),
          ),
          const SizedBox(
            height: 12,
          ),
          Texter(
            desc,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                height: 1.4,
                color: Colors.white),
          ),
          if (link != null) ...[
            const SizedBox(
              height: 15,
            ),
            Linker(
              name: title,
              link: link!,
              child: InkWell(
                onTap: () {
                  AnalyticsService.logProjectLaunched(title);
                  launchUrl(Uri.parse(link!));
                },
                child: Texter(
                  "Visit ${Uri.parse(link!).host} \u{1F680}",
                  select: false,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
