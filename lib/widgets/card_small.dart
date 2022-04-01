import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:esayapp/constants/Theme.dart';

class CardSmall extends StatelessWidget {
  const CardSmall({this.title = "", this.stateText = "",
    this.onTurnOn, this.onTurnOff,});

  final String stateText;
  final String? title;
  final Function? onTurnOn;
  final Function? onTurnOff;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(top: 5),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.lightBlue,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(title ?? '', style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    stateText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("ON", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    onTap: () {
                      onTurnOn!();
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: const Card(
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "OFF",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      onTurnOff!();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
