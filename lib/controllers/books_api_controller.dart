import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BooksApiController {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.nytimes.com/svc/books/v3',
      queryParameters: {
        'api-key': dotenv.env['API_KEY'],
      },
    ),
  );

  Future<List<dynamic>> getBooks() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '/lists.json',
        queryParameters: {
          'list': 'hardcover-fiction',
        },
      );
      List<dynamic> books = response.data!['results'];
      return books;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
