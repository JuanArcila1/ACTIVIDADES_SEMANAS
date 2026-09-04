import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Item {final int id;final String name;final String supplier;final String category;const Item(this.id,this.name,this.supplier,this.category);}
const items=[Item(1,'Café colombiano','Andes Export','Alimentos'),Item(2,'Textiles de algodón','Textil Andina','Textiles'),Item(3,'Electrónica industrial','TechGlobal','Electrónica'),Item(4,'Repuestos automotrices','AutoParts SAS','Repuestos')];
final router=GoRouter(routes:[ShellRoute(builder:(c,s,ch)=>Scaffold(body:ch,bottomNavigationBar:NavigationBar(selectedIndex:s.uri.path=='/about'?1:0,onDestinationSelected:(i)=>i==0?c.go('/'):c.go('/about'),destinations:const[NavigationDestination(icon:Icon(Icons.list),label:'Lista'),NavigationDestination(icon:Icon(Icons.info),label:'Acerca de')])),routes:[GoRoute(path:'/',builder:(c,s)=>const Home()),GoRoute(path:'/about',builder:(c,s)=>const About()),GoRoute(path:'/items/:id',builder:(c,s){final id=int.tryParse(s.pathParameters['id']??'');final item=items.where((x)=>x.id==id).firstOrNull;return Detail(item:item);})]]);
void main()=>runApp(MaterialApp.router(debugShowCheckedModeBanner:false,routerConfig:router));
class Home extends StatelessWidget{const Home({super.key});@override Widget build(c)=>Scaffold(appBar:AppBar(title:const Text('Importaciones')),body:ListView(children:[for(final x in items)ListTile(title:Text(x.name),subtitle:Text(x.supplier),trailing:const Icon(Icons.chevron_right),onTap:()=>c.push('/items/${x.id}',extra:x))]));}
class Detail extends StatelessWidget{final Item? item;const Detail({super.key,this.item});@override Widget build(c)=>Scaffold(appBar:AppBar(title:const Text('Detalle')),body:Center(child:item==null?const Text('Producto no encontrado'):Text('${item!.name}
Proveedor: ${item!.supplier}
Categoría: ${item!.category}',textAlign:TextAlign.center)));}
class About extends StatelessWidget{const About({super.key});@override Widget build(c)=>const Scaffold(appBar:AppBar(title:Text('Acerca de')),body:Padding(padding:EdgeInsets.all(24),child:Text('Aplicación para consultar productos, proveedores y operaciones de una empresa de importación.')));}
