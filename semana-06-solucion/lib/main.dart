import 'package:flutter/material.dart';
void main()=>runApp(const App());
class App extends StatelessWidget{const App({super.key});@override Widget build(BuildContext context)=>MaterialApp(debugShowCheckedModeBanner:false,title:'Importaciones — Semana 06',theme:ThemeData(useMaterial3:true),home:const Home());}
class Home extends StatelessWidget{const Home({super.key});@override Widget build(BuildContext context)=>Scaffold(appBar:AppBar(title:const Text('Empresa de importación')),body:ListView(padding:const EdgeInsets.all(16),children:const[
  Card(child:ListTile(leading:Icon(Icons.inventory_2),title:Text('Productos'),subtitle:Text('Café, textiles, electrónica y repuestos'))),
  Card(child:ListTile(leading:Icon(Icons.business),title:Text('Proveedores'),subtitle:Text('Andes Export, Textil Andina, TechGlobal'))),
  Card(child:ListTile(leading:Icon(Icons.local_shipping),title:Text('Envíos'),subtitle:Text('Seguimiento de mercancía importada'))),
  Card(child:ListTile(leading:Icon(Icons.gavel),title:Text('Aduanas'),subtitle:Text('Documentación y estado aduanero'))),
]));}
