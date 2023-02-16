import 'package:flutter/material.dart';
// import 'package:flutter_notebook_16th_story/ep978_mental_health_app/src/riverpod/chat_text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../riverpod/bottom_tab_provider.dart';
import '../riverpod/chat_text_provider.dart';
import 'chat_screen_component.dart';

class MentalChatComponent extends StatelessWidget {
  const MentalChatComponent({Key? key}) : super(key: key);

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
                      ref.read(chatTextProvider).clear();
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
              Text(
                "Comfort connect",
                style: GoogleFonts.balsamiqSans(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 1.5)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Consumer(
              builder: (context, ref, _) {
                final topTab = ref.watch(mhChatTabProvider);
                return Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(mhChatTabProvider.notifier).state = 0;
                        },
                        child: topTab == 0
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Center(
                                  child: Text(
                                    "Consult",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Consult",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(mhChatTabProvider.notifier).state = 1;
                        },
                        child: topTab == 1
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(24)),
                                child: const Center(
                                  child: Text(
                                    "Description",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Description",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Consumer(builder: (context, ref, _) {
          final topTab = ref.watch(mhChatTabProvider);
          switch (topTab) {
            case 0:
              return const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ChatScreenComponent(),
                ),
              );
            case 1:
              return Container();
            default:
              return Container();
          }
        })
      ],
    );
  }
}
