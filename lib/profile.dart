import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Sample profile data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            DataTable(
              columns: const [
                DataColumn(label: Text('Attribute')),
                DataColumn(label: Text('Value')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('Name')),
                  DataCell(
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Phone Number')),
                  DataCell(
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Phone Number',
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  const DataCell(Text('Email')),
                  DataCell(
                    TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Email',
                      ),
                      onChanged: (value) {
                        setState(() {
                        });
                      },
                    ),
                  ),
                ]),
                // Add more rows for additional information
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to save the edited profile
                // For now, let's just print the values
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
