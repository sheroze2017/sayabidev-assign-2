import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:sayabidev_group_assign_2/getcontrol.dart';

class MyHome extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();
  final controller = Get.put(speechcontroll());

  MyHome({super.key});

  speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(controller.rate.value);
    await flutterTts.speak(text);
  }

  pause(String text) async {
    await flutterTts.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign-2'),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/saya.jpeg'),
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  controller: textController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => controller.onclick(),
                child: CircleAvatar(
                  child: Obx(
                    () => Text(
                      '${controller.rate.value}x',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  radius: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.green,
                            splashColor: Colors.greenAccent,
                            onPressed: () => speak(textController.text)),
                        Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Text('PLAY',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green)))
                      ]),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.blue,
                            splashColor: Colors.blueAccent,
                            onPressed: () => pause(textController.text)),
                        Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            child: Text('PAUSE',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue)))
                      ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
