import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_notebook_16th_story/ep978_mental_health_app/src/riverpod/chat_text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../riverpod/mh_chat_provider.dart';
import '../riverpod/chat_text_provider.dart';

class ChatScreenComponent extends ConsumerWidget {
  const ChatScreenComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black, width: 1.5)),
      child: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final item = ref.watch(mhChatProvider);
                return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    if (item[index].isSend ?? false) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Text(item[index].time ?? "??:??"),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[50],
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    topLeft: Radius.circular(24),
                                    bottomLeft: Radius.circular(24),
                                  )),
                              child: Center(
                                child: Text("${item[index].msg}"),
                              ),
                            )
                          ],
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          // Container(
                          //   height: 38,
                          //   width: 38,
                          //   decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       border: Border.all(width: 1),
                          //       image: DecorationImage(
                          //         image: CachedNetworkImageProvider(
                          //             item[index].profileImg ?? ""),
                          //         fit: BoxFit.cover,
                          //       )),
                          // ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                border: Border.all(color: Colors.black),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  topLeft: Radius.circular(24),
                                  bottomRight: Radius.circular(24),
                                )),
                            child: Center(
                              child: Text(
                                "${item[index].msg}",
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(item[index].time ?? "??:??"),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: ref.read(chatTextProvider),
                  onSubmitted: (v) {
                    print("onSubmitted()");
                    print(v);
                  },
                  onEditingComplete: () {
                    print("onEditingComplete()");
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Type your messages...",
                  ),
                )),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    if (ref.read(chatTextProvider).text.isNotEmpty) {
                      ref.read(mhChatProvider.notifier).add();
                      ref.read(chatTextProvider).clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                        )),
                    child: Transform.rotate(
                      angle: -pi / 4,
                      child: const Center(
                        child: Icon(
                          Icons.send,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
