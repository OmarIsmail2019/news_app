import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/resources/string_manager.dart';
import '../resources/routes_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.homeRoute);
                },
                icon: const Icon(Icons.home),
                label: Text(
                  AppString.home,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.worldRoute);
                },
                icon: const Icon(Icons.language),
                label: Text(
                  AppString.world,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.businessRoute);
                },
                icon: const Icon(Icons.business_sharp),
                label: Text(
                  AppString.business,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.sportRoute);
                },
                icon: const Icon(Icons.sports_football),
                label: Text(
                  AppString.sports,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.healthRoute);
                },
                icon: const Icon(Icons.health_and_safety),
                label: Text(
                  AppString.health,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.settingRoute);
                },
                icon: const Icon(Icons.settings),
                label: Text(
                  AppString.setting,
                  style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
