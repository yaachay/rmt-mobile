import 'package:flutter/material.dart';
import './screens.dart';
import '../services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController rakhineTextController = TextEditingController();
  final TextEditingController myanmarTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('RM Translator'),
      ),
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
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: rakhineTextController,
              minLines: 3,
              maxLines: null,
              style: const TextStyle(
                fontFamily: 'Pyidaungsu',
              ),
              decoration: const InputDecoration.collapsed(
                hintText: 'Rakhine Language',
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (value) => {
                setState(() async {
                  String text = await TranslatorService.rkToMY(value);
                  myanmarTextController.text = text;
                }),
              },
            ),
            const Divider(
              height: 20,
              thickness: 2,
            ),
            TextFormField(
              controller: myanmarTextController,
              minLines: 3,
              maxLines: null,
              style: const TextStyle(
                fontFamily: 'Pyidaungsu',
              ),
              decoration: const InputDecoration.collapsed(
                hintText: 'Myanmar Language',
              ),
              keyboardType: TextInputType.multiline,
              onChanged: (value) => {
                setState(() async {
                  String text = await TranslatorService.my2RK(value);
                  rakhineTextController.text = text;
                }),
              },
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton.filled(
          onPressed: () {
            rakhineTextController.text = "";
            myanmarTextController.text = "";
          },
          icon: const Icon(
            Icons.clear,
          )),
    );
  }
}
