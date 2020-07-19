import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_change_notifier_sample/constants/theme_data.dart';
import '../data.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Alarm',
            style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24),
          ),
          Expanded(
            child: ListView(
              children: alarms
                  .map<Widget>((alarm) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 32),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: alarm.gradientColors,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        boxShadow: [
                          BoxShadow(
                            color: alarm.gradientColors.last.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.label,
                                      color: Colors.white, size: 24),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Office',
                                    style: TextStyle(
                                        fontFamily: 'avenir',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Switch(
                                onChanged: (bool value) {},
                                value: true,
                              )
                            ],
                          ),
                          Text(
                            'Mon - Fri',
                            style: TextStyle(
                                fontFamily: 'avenir', color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '07:00 AM',
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  })
                  .toList()
                  .followedBy([
                    DottedBorder(
                        strokeWidth: 3,
                        color: CustomColors.clockOutline,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(24),
                        dashPattern: [5,4],
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: CustomColors.clockBG,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                          
                            child: FlatButton(
                          padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),  
                              onPressed: () {},
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/add_alarm.png',
                                    scale: 1.5,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text('Add Alarm',
                                      style: TextStyle(
                                          fontFamily: 'avenir',
                                          color: Colors.white))
                                ],
                              ),
                            ))),
                  ])
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
