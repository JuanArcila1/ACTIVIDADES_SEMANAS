import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
class Item{final int id;final String name;final String supplier;const Item(this.id,this.name,this.supplier);}
const items=[Item(1,'Café colombiano','Andes Export'),Item(2,'Textiles de algodón','Textil Andina'),Item(3,'Electrónica industrial','TechGlobal'),Item(4,'Repuestos automotrices','AutoParts SAS')];
class Favorites extends ChangeNotifier{final Set<int> _ids={};bool isFav(int id)=>_ids.contains(id);void toggle(int id){_ids.contains(id)?_ids.remove(id):_ids.add(id);notifyListeners();}int get count=>_ids.length;}
final router=GoRouter(routes:[GoRoute(path:'/',builder:(c,s)=>const Home()),GoRoute(path:'/item/:id',builder:(c,s)=>Detail(item:items.firstWhere((x)=>x.id==int.parse(s.pathParameters['id']!))))]);
void main()=>runApp(ChangeNotifierProvider(create:(_)=>Favorites(),child:MaterialApp.router(routerConfig:router)));
class Home extends StatelessWidget{const Home({super.key});@override Widget build(c)=>Scaffold(appBar:AppBar(title:const Text('Importaciones'),actions:[Consumer<Favorites>(builder:(_,f,__)=><Padding(padding:const EdgeInsets.all(16),child:Center(child:Text('★ ${f.count}'))))]),body:ListView(children:[for(final x in items)Consumer<Favorites>(builder:(_,f,__)=><ListTile(title:Text(x.name),subtitle:Text(x.supplier),trailing:IconButton(icon:Icon(f.isFav(x.id)?Icons.star:Icons.star_border),onPressed:()=>f.toggle(x.id)),onTap:()=>c.push('/item/${x.id}')))]));}
class Detail extends StatelessWidget{final Item item;const Detail({super.key,required this.item});@override Widget build(c){final fav=c.watch<Favorites>();return Scaffold(appBar:AppBar(title:Text(item.name),actions:[IconButton(icon:Icon(fav.isFav(item.id)?Icons.star:Icons.star_border),onPressed:()=>c.read<Favorites>().toggle(item.id))]),body:Center(child:Text('Proveedor: ${item.supplier}')));}}
