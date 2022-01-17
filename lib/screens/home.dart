import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:frasesemensagens/screens/quote_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _quotes = [];

  Future<void> getJson() async {
    final String response = await rootBundle.loadString('assets/quotes.json');
    final data = await json.decode(response);

    setState(() {
      _quotes = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.black26,
          ),
          itemCount: _quotes.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuoteList(
                      title: _quotes[index]['name'],
                      quotes: _quotes[index]['quotes'] ?? [],
                    ),
                  ),
                );
              },
              title: Text(_quotes[index]['name']),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
        ),
      ),
    );
  }
}
