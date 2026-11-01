import 'package:flutter/material.dart';
import 'package:portfolio/firebase/analytics.dart';
import 'package:portfolio/sizes.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

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
            "Experience",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 34,
                color: Theme.of(context).secondaryHeaderColor),
          ),
          const SizedBox(
            height: 35,
          ),
          const Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 40,
            runSpacing: 40,
            children: [
              ExperienceItem(
                company: "Tethxr",
                role: "Founder & Solo Developer",
                period: "Jul 2026 – Present",
                about: "Social app for meeting people in the same physical space (iOS, Android)",
                link: "https://tethxr.com",
                desc: "\u{25ca} Designed, built and launched the app solo; 500+ users in month one and 350+ chats opened.\n"
                    "\u{25ca} Serverless Supabase backend (SQL RPCs, Realtime, Auth, Edge Functions) with Firebase.\n"
                    "\u{25ca} Nearby-user detection over Wi-Fi, Bluetooth and GPS without sharing exact location.\n"
                    "\u{25ca} Envelope-encrypted chat, decrypted in an iOS Notification Service Extension.\n"
                    "\u{25ca} Native iOS and Android cameras over Pigeon, making capture near-instant.\n"
                    "\u{25ca} Shipped 1.0 to 1.5.3 in 3 months.",
              ),
              ExperienceItem(
                company: "Kutuki",
                role: "Frontend Engineer",
                period: "Apr 2023 – Present",
                about: "Kids' learning app across Android, iOS, Auto and TV",
                desc: "\u{25ca} 99.6% crash-free sessions for an app with 5M+ downloads and 1M peak MAU.\n"
                    "\u{25ca} Integrated Google Play/App Store Billing and Razorpay.\n"
                    "\u{25ca} Built the TV app alone in 3 weeks with QR sign-in; 99.7% crash-free.\n"
                    "\u{25ca} Built an automotive app without Google Play services.\n"
                    "\u{25ca} Cut load times by 80% with GetX and deferred loading.\n"
                    "\u{25ca} Built 15+ games per section across Grammar and Math with Lottie animations.",
              ),
              ExperienceItem(
                company: "Freelance",
                role: "Consultant – Mobile Developer",
                period: "Sep 2019 – Apr 2023",
                about: "Flutter apps for clients across the globe",
                desc: "\u{25ca} Architected a PayU payment flow for a home appliances client.\n"
                    "\u{25ca} Built styled Google Maps polylines for a health-industry client.\n"
                    "\u{25ca} Integrated PDF reader, image-to-PDF and border detection for a billing app.\n"
                    "\u{25ca} Delivered a clothing-brand e-commerce app in 4 weeks and a gym slot-booking app.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.company, required this.role, required this.period, required this.about, required this.desc, this.link});

  final String company, role, period, about, desc;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
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
            company,
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
              name: company,
              link: link!,
              child: InkWell(
                onTap: () {
                  AnalyticsService.logProjectLaunched(company);
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
