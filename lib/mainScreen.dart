import 'package:flutter/material.dart';
import 'dart:convert'; // Import for JSON decoding
import 'dart:io'; // Import for file I/O

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  List<dynamic> jsonData = []; // List to store JSON data

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    final jsonContent = await loadJsonDataFromExternalPath(
        'C:\\Users\\pakih\\projects\\python_1\\output.json');
    final decodedData = json.decode(jsonContent);
    setState(() {
      jsonData = decodedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display JSON"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: jsonData.length, // Number of items in JSON data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jsonData[index]
                ['title']), // Assuming there's a 'title' key in JSON
            subtitle: Text(jsonData[index][
                'description']), // Assuming there's a 'description' key in JSON
          );
        },
      ),
    );
  }
}

Future<String> loadJsonDataFromExternalPath(String filePath) async {
  try {
    File jsonFile = File(filePath);
    String jsonContent = await jsonFile.readAsString();
    return jsonContent;
  } catch (e) {
    print('Error reading JSON file: $e');
    return '';
  }
}
