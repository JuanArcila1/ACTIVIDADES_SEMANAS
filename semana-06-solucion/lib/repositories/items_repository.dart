import 'package:dio/dio.dart';
class ItemsRepository { final Dio dio; ItemsRepository(this.dio); Future<List<Map<String,dynamic>>> fetchItems() async { final r=await dio.get('https://jsonplaceholder.typicode.com/posts'); return (r.data as List).take(4).map((e)=>{'id':e['id'],'name':e['title'],'description':e['body']}).toList(); } }
