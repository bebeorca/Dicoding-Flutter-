import 'package:flutter/material.dart';
import 'package:proyek_akhir_dicoding/model/contributorList.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ContributorDetail extends StatelessWidget {
  final ContributorList contributor;
  const ContributorDetail({super.key, required this.contributor});

  static const setColor = Color.fromARGB(255, 57, 167, 225);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: setColor,
        title: Text(
          contributor.name,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 14,
                ),
                CircleAvatar(
                  radius: 68,
                  backgroundImage: NetworkImage(contributor.profilePicture),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(contributor.name),
                const SizedBox(
                  height: 8,
                ),
                ExpansionTile(
                  title: const Text(
                    "Information",
                    style: TextStyle(fontSize: 12),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        contributor.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Contact\n${contributor.email}\n${contributor.phoneNumber}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Attachment"),
          ),
          SizedBox(
              height: 150,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: contributor.projectImage.map((e) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(e),
                      ),
                    );
                  }).toList()))
        ],
      )),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: setColor,
        overlayColor: Colors.black,
        overlayOpacity: .4,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.mail),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Selected email: ${contributor.email}"),
                  duration: const Duration(seconds: 2)))),
          SpeedDialChild(
              child: const Icon(Icons.phone),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Selected phone: ${contributor.phoneNumber}"),
                    duration: const Duration(seconds: 2),
                  )))
        ],
      ),
    );
  }
}
