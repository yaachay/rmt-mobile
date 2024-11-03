import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../services/services.dart';
import './screens.dart';

class ExampleDataScreen extends StatefulWidget {
  const ExampleDataScreen({
    super.key,
  });

  @override
  State<ExampleDataScreen> createState() => ExampleDataScreenState();
}

class ExampleDataScreenState extends State<ExampleDataScreen> {
  List<Map<String, String>> data = [];

  @override
  void initState() {
    super.initState();
    _getDataFromKnowledgebase();
  }

  Future<void> _getDataFromKnowledgebase() async {
    Database database = await OpenDatabaseFromAssets();
    List<Map<String, dynamic>> results =
        await database.rawQuery('SELECT * FROM knowledgebase');
    for (var result in results) {
      data.add({
        'id': result['id'].toString(),
        'rakhine': result['rakhine'].toString(),
        'myanmar': result['myanmar'].toString(),
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example Data')),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Example Data'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExampleDataScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Rakhine')),
            DataColumn(label: Text('Myanmar')),
          ],
          rows: data.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['id']!,style: const TextStyle(fontFamily: 'Pyidaungsu'),)),
              DataCell(Text(item['rakhine']!,style: const TextStyle(fontFamily: 'Pyidaungsu'),)),
              DataCell(Text(item['myanmar']!,style: const TextStyle(fontFamily: 'Pyidaungsu'),)),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
