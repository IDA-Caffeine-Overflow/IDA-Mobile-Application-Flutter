import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/custom_widgets/circle_button.dart';
import 'package:unisys/screens/summary_page.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:unisys/screens/phone_number_page.dart';

class ReportEmergencyPage extends StatefulWidget {
  static const routeName = "ReportEmergencyPage";

  @override
  _ReportEmergencyPageState createState() => _ReportEmergencyPageState();
}

File image;
Position position;
String audio;
Recording recording;
String uid;

class _ReportEmergencyPageState extends State<ReportEmergencyPage> {
  Future getImage() async {
    var i = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      image = i;
    });
  }

  Future getLocation() async {
    var pos = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    setState(() {
      position = pos;
    });
  }

  Future getAudio() async {
    bool hasPermission = await FlutterAudioRecorder.hasPermissions;
    if (hasPermission) {
      setState(() {
        uid = DateTime.now().millisecondsSinceEpoch.toString();
      });
      var localPath = await getExternalStorageDirectory();
      var recorder = FlutterAudioRecorder(
        localPath.path.replaceAll('files', '') + uid,
        audioFormat: AudioFormat.WAV,
      );
      await recorder.initialized;
      print(localPath.path);
      showDialog(
        context: context,
        builder: (context) {
          bool control1 = false;
          bool control2 = false;
          return AlertDialog(
            actions: <Widget>[
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CircleButton(
                            onTap: () async {
                              //assetsAudioPlayer.open(
                              //  'audio/on.wav',
                              //);
                              //assetsAudioPlayer.play();
                              setState(() {
                                control1 = true;
                                control2 = true;
                              });
                              await recorder.start();
                              recording = await recorder.current(channel: 0);
                            },
                            size: 75.0,
                            color: Colors.teal,
                            icon: Icons.mic,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Visibility(
                            visible: control1,
                            child: Text(
                              'RECORDING',
                              style: kText,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          CircleButton(
                            onTap: () async {
                              // assetsAudioPlayer.open(
                              //   'audio/off.wav',
                              // );
                              // assetsAudioPlayer.play();
                              setState(() {
                                control1 = false;
                                control2 = false;
                              });
                              var result = await recorder.stop();
                              String filePath = result.path;
                              setState(() {
                                audio = filePath;
                                print("\n\n\n\n\n" + audio + "\n\n\n\n\n");
                              });
                            },
                            size: 80.0,
                            color: Colors.indigoAccent.withOpacity(0.5),
                            icon: Icons.stop,
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Visibility(
                            visible: control2,
                            child: Text(
                              'STOP',
                              style: kText,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: recording != null,
                        child: Column(
                          children: <Widget>[
                            CircleButton(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              size: 75.0,
                              color: Colors.deepOrangeAccent,
                              icon: Icons.done_outline,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'DONE',
                              style: kText,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
            content: Text(
              'Record Audio',
              style: kHeadingText,
            ),
            contentPadding: EdgeInsets.all(12.0),
          );
        },
      );
    }
  }

  @override
  void initState() {
    print(mobileNumber);
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Report Emergency',
            style: kAppBarText,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              height: 200.0,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'images/emergency.gif',
                  fit: BoxFit.cover,
                  gaplessPlayback: true,
                  alignment: Alignment.center,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      'Capture what is going on around you',
                      textAlign: TextAlign.center,
                      style: kHeadingText,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        'The data uploaded by you will be used by us to get help to you at the earliest. Please follow the emergency safety measures',
                        textAlign: TextAlign.center,
                        style: kText.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                CircleButton(
                                  onTap: () async {
                                    await getImage();
                                  },
                                  size: 80.0,
                                  color: Colors.blueAccent,
                                  icon: Icons.camera,
                                ),
                                image != null
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 30.0,
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: Colors.red,
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: <Widget>[
                                            Button(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              text: 'CLOSE',
                                            ),
                                          ],
                                          content: image != null
                                              ? Image.file(image)
                                              : Center(
                                                  child: Icon(
                                                    Icons.error_outline,
                                                  ),
                                                ),
                                          contentPadding: EdgeInsets.all(12.0),
                                        );
                                      },
                                    );
                                  },
                                  child: image != null
                                      ? Text(
                                          'VIEW',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          'UPLOAD',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                CircleButton(
                                  onTap: getAudio,
                                  size: 100.0,
                                  color: Colors.pinkAccent,
                                  icon: Icons.mic,
                                ),
                                audio != null
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 30.0,
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: Colors.red,
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    int a = 0, b = 0;
                                    AudioPlayer audioPlayer = AudioPlayer();
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: <Widget>[
                                            Button(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              text: 'CLOSE',
                                            ),
                                          ],
                                          content: audio != null
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Column(
                                                      children: <Widget>[
                                                        CircleButton(
                                                          onTap: () async {
                                                            setState(() {
                                                              a = 1;
                                                              b = 0;
                                                            });

                                                            await audioPlayer
                                                                .pause();
                                                          },
                                                          size: 70.0,
                                                          color: Colors
                                                              .amberAccent
                                                              .withOpacity(0.6),
                                                          icon: Icons
                                                              .pause_circle_outline,
                                                        ),
                                                        Text(
                                                          a == 1
                                                              ? 'PAUSED'
                                                              : 'PAUSE',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        CircleButton(
                                                          onTap: () async {
                                                            print(audio);
                                                            setState(() {
                                                              a = 0;
                                                              b = 1;
                                                            });
                                                            await audioPlayer
                                                                .play(
                                                              audio,
                                                              isLocal: true,
                                                            );
                                                          },
                                                          size: 80.0,
                                                          color:
                                                              Colors.blueAccent,
                                                          icon: Icons
                                                              .play_circle_outline,
                                                        ),
                                                        Text(
                                                          b == 1
                                                              ? 'PLAYING...'
                                                              : 'PLAY',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: <Widget>[
                                                        CircleButton(
                                                          onTap: () async {
                                                            await audioPlayer
                                                                .stop();
                                                          },
                                                          size: 70.0,
                                                          color:
                                                              Colors.redAccent,
                                                          icon: Icons.stop,
                                                        ),
                                                        Text(
                                                          'COMPLETE',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Center(
                                                  child: Icon(
                                                    Icons.error_outline,
                                                  ),
                                                ),
                                          contentPadding: EdgeInsets.all(12.0),
                                        );
                                      },
                                    );
                                  },
                                  child: audio != null
                                      ? Text(
                                          'VIEW',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          'RECORD',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                CircleButton(
                                  onTap: () {
                                    position != null
                                        ? showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                actions: <Widget>[
                                                  Button(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    text: 'CLOSE',
                                                  ),
                                                ],
                                                content: Text(
                                                  'Location already calulated, Click VIEW to Confirm',
                                                  style: kSubHeadingText,
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(12.0),
                                              );
                                            })
                                        : getLocation();
                                  },
                                  size: 80.0,
                                  color: Colors.purpleAccent,
                                  icon: Icons.location_on,
                                ),
                                position != null
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 30.0,
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: Colors.red,
                                      ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: <Widget>[
                                            Button(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                text: 'CONFIRM')
                                          ],
                                          content: position != null
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'longitude: ',
                                                          style:
                                                              kSubHeadingText,
                                                        ),
                                                        Text(
                                                          '${position.longitude}',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'latitude: ',
                                                          style:
                                                              kSubHeadingText,
                                                        ),
                                                        Text(
                                                          '${position.latitude}',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'altitude: ',
                                                          style:
                                                              kSubHeadingText,
                                                        ),
                                                        Text(
                                                          '${position.altitude}',
                                                          style: kText,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Center(
                                                  child: Icon(
                                                    Icons.error_outline,
                                                  ),
                                                ),
                                          contentPadding: EdgeInsets.all(12.0),
                                        );
                                      },
                                    );
                                  },
                                  child: position != null
                                      ? Text(
                                          'VIEW',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        )
                                      : Text(
                                          'REFRESH',
                                          style: kText.copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Visibility(
                        visible:
                            image != null && position != null && audio != null,
                        child: Button(
                          onPressed: () {
                            Navigator.pushNamed(context, SummaryPage.routeName);
                          },
                          text: 'PROCEED',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
