import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> location = [
    WorldTime(url: 'Europe/London',location: 'London',flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'germany.png'),
    WorldTime(url: 'Africa/Lagos',location: 'Lagos',flag: 'nigeria.png'),
    WorldTime(url: 'Africa/Cairo',location: 'Cairo',flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago',location: 'Chicago',flag: 'us.png'),
    WorldTime(url: 'America/New_York',location: 'New_York',flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag: 'korea.png'),
    WorldTime(url: 'Asia/Jakarta',location: 'Jakarta',flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = location[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build state function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
        ),
      body: ListView.builder(
        itemCount: location.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(location[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}