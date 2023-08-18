import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LaunchPad",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text("LAUNCH PAD",
                style: TextStyle(
                    fontFamily: 'Handjet',
                    fontSize: 40,
                    color: Colors.red,
                    letterSpacing: 2)),
            centerTitle: true,
          ),
          body: const Center(
            child: Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "1.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "2.mp3"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "3.mp3"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "4.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "5.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "6.mp3"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "7.mp3"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "8.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "9.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "10.mp3"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "11.mp3"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "12.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "13.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "14.mp3"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "15.mp3"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "16.mp3"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "17.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "18.mp3"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "19.mp3"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "20.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "21.mp3"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "22.wav"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "23.wav"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "24.wav"),
                Pad(Color(0xffADCBFC), Color(0xff067CCB), "25.wav"),
                Pad(Color(0xfffcadad), Color(0xffcb0606), "26.wav"),
                Pad(Color(0xffc1fcad), Color(0xff48cb06), "27.wav"),
                Pad(Color(0xfff4adfc), Color(0xffcb06c8), "28.wav"),
              ],
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}

class Pad extends StatefulWidget {
  final colorCenter;
  final colorOutline;
  final note;
  const Pad(this.colorCenter, this.colorOutline, this.note, {super.key});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  late Color _colorCenter;
  late Color _colorOutline;
  final player = AudioPlayer();
  @override
  void initState() {
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(AssetSource(widget.note));
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          _colorOutline = widget.colorOutline;
          _colorCenter = widget.colorCenter;
        });
      },
      child: Container(
        height: height / 8.2,
        width: width / 4.3,
        decoration: BoxDecoration(
            gradient: RadialGradient(colors: [_colorCenter, _colorOutline])),
      ),
    );
  }
}
