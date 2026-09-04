import 'package:flutter/material.dart';

void main() => runApp(const ImportApp());

class Item { final int id; final String name; final String supplier; final String category; const Item(this.id,this.name,this.supplier,this.category); }

const items = [
  Item(1,'Café colombiano','Andes Export','Alimentos'),
  Item(2,'Textiles de algodón','Textil Andina','Textiles'),
  Item(3,'Electrónica industrial','TechGlobal','Electrónica'),
  Item(4,'Repuestos automotrices','AutoParts SAS','Repuestos'),
];

class ImportApp extends StatelessWidget { const ImportApp({super.key}); @override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,title:'Importaciones',theme:ThemeData(useMaterial3:true),home:const HomeScreen()); }

class HomeScreen extends StatefulWidget { const HomeScreen({super.key}); @override State<HomeScreen> createState()=>_HomeScreenState(); }
class _HomeScreenState extends State<HomeScreen> { String query=''; @override Widget build(BuildContext context){ final filtered=items.where((x)=>'${x.name} ${x.supplier} ${x.category}'.toLowerCase().contains(query.toLowerCase())).toList(); return Scaffold(appBar:AppBar(title:const Text('Empresa de importación')),body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[TextField(onChanged:(v)=>setState(()=>query=v),decoration:const InputDecoration(prefixIcon:Icon(Icons.search),labelText:'Buscar productos o proveedores',border:OutlineInputBorder())),const SizedBox(height:16),Expanded(child:filtered.isEmpty?const Center(child:Text('No hay resultados')):ListView.builder(itemCount:filtered.length,itemBuilder:(context,i){final x=filtered[i];return Card(child:ListTile(leading:CircleAvatar(child:Text('${x.id}')),title:Text(x.name),subtitle:Text('${x.supplier} • ${x.category}')));}))]))); } }
