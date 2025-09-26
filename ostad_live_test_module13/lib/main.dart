import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const ContactApp()));
}

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {"name": "Jawad", "phone": "01877-777777"},
      {"name": "Ferdous", "phone": "01577-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},
      {"name": "Hasan", "phone": "01745-777777"},

    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Contact List",
        style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number",
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text("Add",
                  style: TextStyle(color: Colors.white),),
              ),
            ),
            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.person, color: Colors.brown),
                      title: Text(
                        contact["name"]!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(contact["phone"]!),
                      trailing: const Icon(Icons.call, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
