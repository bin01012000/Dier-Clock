import 'package:flutter/material.dart';

import 'clock_view.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({
    Key? key,
    required this.formattedTime,
    required this.formattedDate,
    required this.offsetSign,
    required this.timezoneString,
  }) : super(key: key);

  final String formattedTime;
  final String formattedDate;
  final String offsetSign;
  final String timezoneString;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              "Clock",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 24),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: const TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 64),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 4,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Time zone",
                  style: TextStyle(
                      fontFamily: 'avenir', color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Icon(Icons.language, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      "UTC ($offsetSign${timezoneString.substring(0, timezoneString.indexOf(':'))})",
                      style: const TextStyle(
                          fontFamily: 'avenir',
                          color: Colors.white,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
