import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:talkspace/screens/BookAppointmentPage.dart';
import 'package:talkspace/screens/SignUpForm.dart';
import 'package:talkspace/screens/doctor_profile.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:alan_voice/alan_voice.dart';

import '../../riverpod/bottom_tab_provider.dart';

class MentalHomeComponent extends StatelessWidget {
  MentalHomeComponent({Key? key}) : super(key: key);
  List doctors = [
    {
      "name": "Emma Johnson",
      "image_link":
          "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
    },
    {
      "name": "Maxwell Lee",
      "image_link":
          "https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
    },
    {
      "name": "Sophia Patel",
      "image_link":
          "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"
    },
    {
      "name": "Oliver Brown",
      "image_link":
          "https://images.unsplash.com/photo-1594824476967-48c8b964273f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                "Comfort Connect",
                style: GoogleFonts.balsamiqSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: (() => callNumber()),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      )),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  child: Text(
                    "SOS",
                    style: GoogleFonts.balsamiqSans(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              PopupMenuButton(
                icon: Icon(Icons.settings),
                onSelected: (value) {
                  value();
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      'About us',
                      style: GoogleFonts.balsamiqSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: () {
                      debugPrint('About');
                    },
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Sign out',
                      style: GoogleFonts.balsamiqSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpForm()),
                      );
                      debugPrint('Signing out');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: const Icon(
                  Ionicons.person_outline,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello SunSeeker",
                      style: GoogleFonts.balsamiqSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Let's explore all the features here",
                      style: GoogleFonts.balsamiqSans(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Use Voice in Twilio",
                style: GoogleFonts.balsamiqSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 1.5)),
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Features",
                          style: GoogleFonts.balsamiqSans(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Talk through your anxiety",
                          style: GoogleFonts.balsamiqSans(
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: InkWell(
                        onTap: () {
                          // final String apiUrl =
                          //     'https://backendgpt-production.up.railway.app/twilcall/call';

                          // await http.get(Uri.parse(apiUrl)).then((response) {
                          //   if (response.statusCode == 200) {
                          //     final jsonData = json.decode(response.body);
                          //     print(jsonData);
                          //   } else {
                          //     print(
                          //         'Request failed with status: ${response.statusCode}.');
                          //   }
                          // });
                          // _launchURL();
                          // callTwilio();
                          fetchAlbum();
                          print('mic');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.mic),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            children: [
              Text(
                "Meet Councellors",
                style: GoogleFonts.balsamiqSans(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    "See All",
                    style: GoogleFonts.balsamiqSans(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 2,
                    width: 42,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                            )),
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookAppointmentPage(),
                                ),
                              );
                            },
                            child: Image.network(
                                doctors[index]['image_link'].toString(),
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Talk",
                        style: GoogleFonts.balsamiqSans(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: doctors.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            "My 4 Am Friends",
            style: GoogleFonts.balsamiqSans(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 84,
                  width: 84,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/11/23/18/18/birds-5770589_960_720.jpg",
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "How are you feeling?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: InkWell(
                        onTap: () {
                          fetchAlbum();
                        },
                        child: const Center(
                          child: Text(
                            "Talk Now",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Use the chat option below.',
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                      softWrap: false,
                      style: GoogleFonts.balsamiqSans(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer(
            builder: (context, ref, _) {
              final index = ref.watch(mhBottomTabProvider);
              return Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    index == 0
                        ? GestureDetector(
                            onTap: () {
                              ref.read(mhBottomTabProvider.notifier).state = 0;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: const Icon(Ionicons.home),
                            ),
                          )
                        : IconButton(
                            onPressed: () => ref
                                .read(mhBottomTabProvider.notifier)
                                .state = 0,
                            icon: const Icon(Ionicons.home),
                            color: Colors.white,
                          ),
                    index == 1
                        ? GestureDetector(
                            onTap: () {
                              ref.read(mhBottomTabProvider.notifier).state = 0;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: const Icon(Ionicons.chatbubble_outline),
                            ),
                          )
                        : IconButton(
                            onPressed: () => ref
                                .read(mhBottomTabProvider.notifier)
                                .state = 1,
                            icon: const Icon(Ionicons.chatbubble_outline),
                            color: Colors.white,
                          ),
                    index == 2
                        ? GestureDetector(
                            onTap: () {
                              ref.read(mhBottomTabProvider.notifier).state = 0;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: const Icon(Ionicons.apps_outline),
                            ),
                          )
                        : IconButton(
                            onPressed: () => ref
                                .read(mhBottomTabProvider.notifier)
                                .state = 2,
                            icon: const Icon(Ionicons.apps_outline),
                            color: Colors.white,
                          ),
                    index == 3
                        ? GestureDetector(
                            onTap: () {
                              ref.read(mhBottomTabProvider.notifier).state = 0;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.5,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: const Icon(Ionicons.document_text_outline),
                            ),
                          )
                        : IconButton(
                            onPressed: () => ref
                                .read(mhBottomTabProvider.notifier)
                                .state = 3,
                            icon: const Icon(Ionicons.document_text_outline),
                            color: Colors.white,
                          )
                  ],
                ),
              );
            },
          ),
        ),
        // _MyHomePageState(),
      ],
    );
  }
}

callNumber() async {
  const number = '+91112'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  print('Inside Function');
}

callTwilio() async {
  const number = '+916392031302'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  print('Inside Function');
}

Future<void> fetchAlbum() async {
  try {
    print("hii");
    var response = await http.get(Uri.parse(
        "https://backendgpt-production.up.railway.app/calltwilio/call"));
    if (response.statusCode == 200) {
      print('Success');
    } else {
      print('Failed');
    }
  } catch (e) {
    print(e);
  }
}
