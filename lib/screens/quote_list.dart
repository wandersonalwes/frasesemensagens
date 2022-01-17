import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class QuoteList extends StatelessWidget {
  final List<dynamic> quotes;
  final String title;
  const QuoteList({Key? key, required this.quotes, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        quotes[index],
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(children: [
                      IconButton(
                        onPressed: () {
                          Share.share(quotes[index]);
                        },
                        icon: const Icon(Icons.share),
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: quotes[index]));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Copiado com sucesso!'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.content_copy),
                      ),
                    ]),
                  ],
                ),
                const Divider(
                  color: Colors.black26,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
