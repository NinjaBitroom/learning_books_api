import 'package:flutter/material.dart';
import 'package:learning_books_api/controllers/books_api_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<dynamic> _books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Books API App'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _books.length,
          itemBuilder: (context, index) =>
              Text(_books[index]['book_details'][0]['title'].toString()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final books = await BooksApiController().getBooks();
          setState(() {
            _books = books;
          });
        },
        tooltip: 'Recarregar',
        child: const Icon(Icons.restart_alt),
      ),
    );
  }
}
