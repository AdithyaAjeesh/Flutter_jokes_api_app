import 'package:flutter/material.dart';
import 'package:flutter_mock_api_app/controller/contacts_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactsController>(context);
    final joke = provider.charachterModel?.joke;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              width: 250,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(joke.toString()),
                  ElevatedButton(
                    onPressed: () {
                      provider.fetchData();
                    },
                    child: const Text('Check'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
