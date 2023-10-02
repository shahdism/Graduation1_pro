import 'package:flutter/material.dart';

class ServiceItem {
  final String name;
  final String description;
  final AssetImage image;
  final Widget servicePageRoute; // Store the page route widget

  ServiceItem({
    required this.name,
    required this.description,
    required this.image,
    required this.servicePageRoute,
  });
}

class ServicePage extends StatefulWidget {
  final String userType;

  ServicePage({required this.userType});

  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  List<ServiceItem> services = [
    ServiceItem(
      name: 'Wedding',
      description: 'Have a nice wedding',
      image: AssetImage('images/download.png'),
      servicePageRoute: WeddingServicePage(), // Navigate to WeddingServicePage when selected
    ),
    ServiceItem(
      name: 'Service 2',
      description: 'Description for Service 2',
      image: AssetImage('assets/service2.png'),
      servicePageRoute: Service2Page(), // Navigate to Service2Page when selected
    ),
    ServiceItem(
      name: 'Service 3',
      description: 'Description for Service 3',
      image: AssetImage('assets/service3.png'),
      servicePageRoute: Service3Page(), // Navigate to Service3Page when selected
    ),
    // Add more services as needed
  ];

  List<Item> items = [
    Item(
      headerValue: 'Additional Options',
      expandedValue: 'Request Login: Additional information for requesting login.',
    ),
    Item(
      headerValue: 'Contact Us',
      expandedValue: 'Contact information and details.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Page - ${widget.userType}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Select a Service:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Service selection buttons
            for (final service in services)
              ElevatedButton(
                onPressed: () {
                  // Navigate to the respective service page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => service.servicePageRoute,
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image(image: service.image, height: 100, width: 100),
                    Text(service.name),
                  ],
                ),
              ),
            SizedBox(height: 20),
            // Additional options for visitors
            ExpansionTile(
              title: Text('Additional Options'),
              children: [
                ListTile(
                  title: Text(
                    'Request Login: Additional information for requesting login.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('Contact Us'),
              children: [
                ListTile(
                  title: Text(
                    'Contact information and details.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}

class WeddingServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wedding Service Page'),
      ),
      body: Center(
        child: Text('Welcome to the Wedding Service Page!'),
      ),
    );
  }
}

class Service2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service 2 Page'),
      ),
      body: Center(
        child: Text('Welcome to Service 2 Page!'),
      ),
    );
  }
}

class Service3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service 3 Page'),
      ),
      body: Center(
        child: Text('Welcome to Service 3 Page!'),
      ),
    );
  }
}
