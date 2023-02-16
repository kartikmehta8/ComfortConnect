import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../data/fake_wellness.dart';
import '../../riverpod/bottom_tab_provider.dart';

class MentalWellnessComponent extends StatelessWidget {
  MentalWellnessComponent({Key? key}) : super(key: key);
  List NGO = [
    {
      "name": "Child Rights and You (CRY)",
      "mobile_number": "+91-22-61454900",
      "address": "189/A Anand Estate, Sane Guruji Marg, Mumbai - 400011, India",
      "image_link":
          "https://www.cry.org/wp-content/uploads/2019/04/logo_cry.jpg"
    },
    {
      "name": "ActionAid India",
      "mobile_number": "+91-11-4155-2300",
      "address": "A-3, Defence Colony, New Delhi - 110024, India",
      "image_link":
          "https://www.actionaidindia.org/wp-content/themes/aii/images/logo.svg"
    },
    {
      "name": "HelpAge India",
      "mobile_number": "+91-11-41688955",
      "address": "C-14, Qutab Institutional Area, New Delhi - 110016, India",
      "image_link":
          "https://www.helpageindia.org/wp-content/uploads/2018/03/logo.png"
    },
    {
      "name": "Oxfam India",
      "mobile_number": "+91-11-4653-8000",
      "address":
          "4th and 5th Floor, Shriram Bharatiya Kala Kendra, Copernicus Marg, New Delhi - 110001, India",
      "image_link":
          "https://www.oxfamindia.org/sites/all/themes/oxfamindia/images/logo.png"
    },
    {
      "name": "SOS Children's Villages",
      "mobile_number": "+91-11-49500500",
      "address":
          "SOS Children's Villages of India, National Office, Plot No.4, Block C-1, Institutional Area, Nelson Mandela Marg, Vasant Kunj, New Delhi - 110070, India",
      "image_link":
          "https://www.soschildrensvillages.in/sites/default/files/2021-05/logo_2.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, ref, _) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(mhBottomTabProvider.notifier).state = 0;
                    },
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              Text("Wellness",
                  style: GoogleFonts.balsamiqSans(
                    fontWeight: FontWeight.bold,
                  )),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join for creating lasting change and impact",
                  style: GoogleFonts.balsamiqSans(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // const Text(
                //   "The essential wellness part works to develop helpful beliefs about your life",
                //   style: TextStyle(
                //       fontWeight: FontWeight.w400, color: Colors.grey),
                // ),
                // const SizedBox(
                //   height: 24,
                // ),
                // Row(
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 16,
                //         vertical: 4,
                //       ),
                //       decoration: BoxDecoration(
                //         color: Colors.yellow,
                //         borderRadius: BorderRadius.circular(16),
                //         border: Border.all(color: Colors.black, width: 1.5),
                //       ),
                //       child: const Center(
                //         child: Text(
                //           "Unlock All",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold, fontSize: 12),
                //         ),
                //       ),
                //     ),
                //     const Spacer(),
                //     const Icon(Ionicons.thumbs_up_outline),
                //     const SizedBox(
                //       width: 16,
                //     ),
                //     const Icon(Ionicons.share_social)
                //   ],
                // ),
                Center(
                  child: const Image(
                    image: AssetImage('assets/images/logo5.png'),
                    height: 200,
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 24),
                //   child: Divider(color: Colors.black),
                // ),
                Text(
                  "Some Non-Governmental Organizations",
                  style: GoogleFonts.balsamiqSans(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                    child: ListView.builder(
                        itemCount: fakeWellness.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Container(
                              height: 110,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/logo2.jpg'),
                                            fit: BoxFit.cover)),
                                    // child: Center(
                                    //   child: CircleAvatar(
                                    //     backgroundColor:
                                    //         (fakeWellness[index].isLock ??
                                    //                 false)
                                    //             ? Colors.red
                                    //             : Colors.blue,
                                    //     foregroundColor: Colors.white,
                                    //     child: Icon(
                                    //         (fakeWellness[index].isLock ??
                                    //                 false)
                                    //             ? Icons.visibility
                                    //             : Icons.lock),
                                    //   ),
                                    // ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          fakeWellness[index].title ?? "",
                                          style: GoogleFonts.balsamiqSans(
                                              // fontWeight: FontWeight.bold,
                                              // fontSize: 20,
                                              ),
                                        ),
                                        Text(
                                          fakeWellness[index].subtitle ?? "",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          fakeWellness[index].time ?? "",
                                          style: GoogleFonts.balsamiqSans(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
