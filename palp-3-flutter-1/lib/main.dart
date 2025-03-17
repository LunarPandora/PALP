import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    final List<Device> deviceList = [
      Device(icon: Icons.lightbulb_outline, deviceName: 'Lamp', roomName: 'Kitchen'),
      Device(icon: Icons.tv, deviceName: 'Smart TV', roomName: 'Living Room'),
      Device(icon: Icons.lock_outline, deviceName: 'Smart Lock', roomName: 'Front Door'),
      Device(icon: Icons.ac_unit, deviceName: 'Air Conditioner', roomName: 'Bedroom'),
      Device(icon: Icons.local_laundry_service_outlined, deviceName: 'Washing Machine', roomName: 'Laundry'),
      Device(icon: Icons.laptop, deviceName: 'Laptop', roomName: 'Bedroom'),
    ];

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        // appBar: AppBar(title: const Text(appTitle)),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFDBE5ED)
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TitleSection(username: 'Michael Newton', greeting: 'Good Morning'),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        WeatherSection(location: 'Pontianak, Indonesia', weather: 'Sunny', temp: '32° C'),
                        SizedBox(height: 40),
                        DeviceSection(title: 'My Devices'),
                        SizedBox(height: 40),
                        DeviceSwitchSection(deviceList: deviceList)
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.username, required this.greeting});

  final String username;
  final String greeting;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://images.pexels.com/photos/2341350/pexels-photo-2341350.jpeg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greeting,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey
                    )
                  ),
                  Text(
                    username,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    )
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          ClipOval(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: () => { print('Hello there!') }, 
                icon: Icon(Icons.notifications_none),
              )
            ),
          )
        ],
      )
    );
  }
}

class WeatherSection extends StatelessWidget{
  const WeatherSection({super.key, required this.location, required this.weather, required this.temp});

  final String location;
  final String weather;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF494868),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.sunny,
                color: Colors.yellow,
                size: 30,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                    )
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    )
                  )
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            temp,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}

class DeviceSection extends StatelessWidget{
  const DeviceSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                  ),
                  child: IconButton(
                    onPressed: () => { print('Add new!') }, 
                    icon: Icon(Icons.add, size: 30, color: Colors.white,),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('Lamp') }, 
                    icon: Icon(Icons.lightbulb_outlined, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('TV') }, 
                    icon: Icon(Icons.tv, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('Lock') }, 
                    icon: Icon(Icons.lock_outline, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('AC') }, 
                    icon: Icon(Icons.ac_unit, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('Washing Machine') }, 
                    icon: Icon(Icons.local_laundry_service_outlined, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () => { print('PC') }, 
                    icon: Icon(Icons.computer, size: 30),
                    padding: EdgeInsets.all(15),
                  )
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}

class Device{
  IconData icon;
  String deviceName;
  String roomName;
  bool isOn;

  Device({required this.icon, required this.deviceName, required this.roomName, this.isOn = false});
}

class DeviceSwitchSection extends StatefulWidget{
  const DeviceSwitchSection({super.key, required this.deviceList});

  final List<Device> deviceList;

  @override
  _DeviceSwitchSectionState createState() => _DeviceSwitchSectionState();
}

class _DeviceSwitchSectionState extends State<DeviceSwitchSection>{
  @override
  Widget build(BuildContext context) {
    List<Widget> devices = []; 
    double screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    bool isMobile = screenWidth < 600;  // Mobile
    bool isTablet = screenWidth >= 600 && screenWidth < 1024; // Tablet
    // bool isDesktop = screenWidth >= 1024; // Desktop

    // Define the number of columns based on breakpoints
    int columns = isMobile ? 2 : (isTablet ? 3 : 4);

    for(int i = 0; i < widget.deviceList.length; i++){
      devices.add(
        SizedBox(
          width: screenWidth / columns - 20,
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: Icon(
                          widget.deviceList[i].icon,
                        ),
                      )
                    ),
                    Spacer(),
                    Container(
                      child: Switch(
                        value: widget.deviceList[i].isOn,
                        onChanged: (val) {
                          setState(() {
                            widget.deviceList[i].isOn = val;
                          });
                        },
                        activeTrackColor: Colors.green,
                        activeColor: Colors.white,
                        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states) {
                          return Colors.transparent;
                        }),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.deviceList[i].deviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      widget.deviceList[i].roomName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                      ),
                    ),
                  ],
                )
              ],
            )
          )
        )
      );
    }

    return Container(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: devices,
      ),
    );   
  }
}