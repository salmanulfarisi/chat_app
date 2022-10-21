import 'dart:io';

import 'package:chat_app/modules/individual_chat.dart/controller/controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualView extends GetView<IndividualController> {
  const IndividualView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 88,
          leading: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: Text("A"),
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("A"),
              Text(
                "Active now",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child: WillPopScope(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      controller.showEmojiPicker.value =
                                          !controller.showEmojiPicker.value;
                                      controller.focusNode.unfocus();
                                      controller.focusNode.canRequestFocus =
                                          true;
                                    },
                                    icon: const Icon(
                                        Icons.emoji_emotions_outlined),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      focusNode: controller.focusNode,
                                      controller:
                                          controller.textEditingController,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          controller.sendButtonEnabled.value =
                                              true;
                                        } else {
                                          controller.sendButtonEnabled.value =
                                              false;
                                        }
                                      },
                                      maxLines: 5,
                                      minLines: 1,
                                      keyboardType: TextInputType.multiline,
                                      decoration: const InputDecoration(
                                        hintText: "Type a message",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.attach_file),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Obx(
                            () => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  controller.sendButtonEnabled.value
                                      ? Icons.send
                                      : Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => Offstage(
                          offstage: !controller.showEmojiPicker.value,
                          child: SizedBox(
                              height: 250,
                              child: EmojiPicker(
                                onEmojiSelected: (category, emoji) {
                                  controller.textEditingController.text =
                                      controller.textEditingController.text +
                                          emoji.emoji;
                                },
                                onBackspacePressed: () {},
                                config: Config(
                                  columns: 7,
                                  // Issue: https://github.com/flutter/flutter/issues/28894
                                  emojiSizeMax:
                                      32 * (Platform.isIOS ? 1.30 : 1.0),
                                  verticalSpacing: 0,
                                  horizontalSpacing: 0,
                                  gridPadding: EdgeInsets.zero,
                                  initCategory: Category.RECENT,
                                  bgColor: const Color(0xFFF2F2F2),
                                  indicatorColor: Colors.blue,
                                  iconColor: Colors.grey,
                                  iconColorSelected: Colors.blue,
                                  backspaceColor: Colors.blue,
                                  skinToneDialogBgColor: Colors.white,
                                  skinToneIndicatorColor: Colors.grey,
                                  enableSkinTones: true,
                                  showRecentsTab: true,
                                  recentsLimit: 28,
                                  replaceEmojiOnLimitExceed: false,
                                  noRecents: const Text(
                                    'No Recents',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black26),
                                    textAlign: TextAlign.center,
                                  ),
                                  loadingIndicator: const SizedBox.shrink(),
                                  tabIndicatorAnimDuration: kTabScrollDuration,
                                  categoryIcons: const CategoryIcons(),
                                  buttonMode: ButtonMode.MATERIAL,
                                  checkPlatformCompatibility: true,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  onWillPop: () async {
                    if (controller.showEmojiPicker.value) {
                      controller.showEmojiPicker.value = false;
                      return false;
                    }
                    return true;
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
