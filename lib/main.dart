import 'package:flutter/material.dart';

void main() {
  runApp(LifeGenieApp());
}

// ------------------------ ALERTS ------------------------
class AlertPage extends StatelessWidget {
  final List<Map<String, String>> alerts = [
    {'title': '50% Off at Local Cafe', 'desc': 'Valid till Sunday!'},
    {'title': 'Blood Donation Camp', 'desc': 'Join at City Hospital'},
    {'title': 'Free Yoga Session', 'desc': 'Tomorrow 7AM, Central Park'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Genie Alerts')),
      body: ListView(
        children: alerts.map((alert) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(alert['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(alert['desc']!),
              trailing: Icon(Icons.notifications_active, color: Colors.indigo),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ------------------------ SKILL EXCHANGE ------------------------
class SkillExchangePage extends StatelessWidget {
  final List<Map<String, String>> skills = [
    {'title': 'Guitar Lessons', 'desc': 'Teach guitar, learn painting'},
    {'title': 'Math Tutoring', 'desc': 'Exchange for coding help'},
    {'title': 'Cooking Skills', 'desc': 'Barter for language lessons'},
  ];

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skill Exchange')),
      body: ListView(
        children: skills.map((skill) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(skill['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(skill['desc']!),
              trailing: ElevatedButton(
                child: Text('Barter'),
                onPressed: () => _showMessage(context, "Barter request for '${skill['title']}' sent!"),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ------------------------ MOOD ASSISTANT ------------------------
class MoodPage extends StatelessWidget {
  final List<Map<String, String>> moods = [
    {'title': 'Feeling Stressed', 'desc': 'Try meditation or a walk'},
    {'title': 'Feeling Happy', 'desc': 'Share your joy with others'},
    {'title': 'Feeling Lonely', 'desc': 'Connect with a friend or join a group'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood Assistant')),
      body: ListView(
        children: moods.map((mood) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(mood['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(mood['desc']!),
              trailing: Icon(Icons.lightbulb_outline, color: Colors.indigo),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class LifeGenieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeGenie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      home: LoginPage(),
    );
  }
}

// ------------------------ LOGIN ------------------------
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 100, color: Colors.indigo),
                SizedBox(height: 20),
                Text("LifeGenie", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------ HOME ------------------------
class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> services = [
    {'title': 'Book Zone', 'desc': 'Buy, Rent or Donate books nearby', 'icon': Icons.menu_book, 'page': BookPage()},
    {'title': 'Bike Zone', 'desc': 'Rent bikes with condition reports', 'icon': Icons.motorcycle, 'page': BikePage()},
    {'title': 'House Services', 'desc': 'Cleaners, Electricians, Repairs', 'icon': Icons.cleaning_services, 'page': HouseServicePage()},
    {'title': 'Skill Exchange', 'desc': 'Barter your talent for help', 'icon': Icons.handshake, 'page': SkillExchangePage()},
    {'title': 'Genie Alerts', 'desc': 'Nearby offers & local needs', 'icon': Icons.notifications, 'page': AlertPage()},
    {'title': 'Mood Assistant', 'desc': 'You feel it, Genie suggests it', 'icon': Icons.mood, 'page': MoodPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LifeGenie')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('Welcome to LifeGenie', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(leading: Icon(Icons.settings), title: Text('Settings'), onTap: () {}),
            ListTile(leading: Icon(Icons.info), title: Text('About'), onTap: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search services...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                var item = services[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Icon(item['icon'], size: 30),
                    title: Text(item['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(item['desc']),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------ BOOK ------------------------
class BookPage extends StatelessWidget {
  final List<Map<String, String>> books = [
    {'title': 'C++ Basics', 'desc': 'Rent for ₹30/week'},
    {'title': 'Physics 12th', 'desc': 'Donate or Exchange'},
    {'title': 'ML Projects', 'desc': 'Available near you'},
  ];

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Zone')),
      body: ListView(
        children: books.map((book) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(book['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(book['desc']!),
              trailing: ElevatedButton(
                child: Text('Request'),
                onPressed: () => _showMessage(context, "Book '${book['title']}' requested successfully!"),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ------------------------ BIKE ------------------------
class BikePage extends StatelessWidget {
  final List<Map<String, String>> bikes = [
    {'title': 'Activa 6G', 'desc': 'Clean, 4⭐ rating'},
    {'title': 'Bajaj Pulsar', 'desc': '₹200/day + Helmet'},
  ];

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bike Rentals')),
      body: ListView(
        children: bikes.map((bike) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(bike['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(bike['desc']!),
              trailing: ElevatedButton(
                child: Text('Book'),
                onPressed: () => _showMessage(context, "${bike['title']} booked successfully!"),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ------------------------ HOUSE SERVICES ------------------------
class HouseServicePage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {'title': 'Cleaner', 'desc': 'Professional home cleaning'},
    {'title': 'Electrician', 'desc': 'Electrical repairs & installations'},
    {'title': 'Plumber', 'desc': 'Leak fixes & pipe installations'},
  ];

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('House Services')),
      body: ListView(
        children: services.map((service) {
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              title: Text(service['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(service['desc']!),
              trailing: ElevatedButton(
                child: Text('Request'),
                onPressed: () => _showMessage(context, "${service['title']} requested!"),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
