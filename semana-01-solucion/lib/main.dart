import 'services/item_repository.dart';

Future<void> main() async {
  final repository = ItemRepository();
  final items = await repository.fetchItems();

  if (items.isEmpty) {
    print('No hay elementos registrados.');
    return;
  }

  print('=== EMPRESA DE IMPORTACIÓN ===');
  for (final item in items) print(item);

  final existing = repository.findById(items, 2);
  final missing = repository.findById(items, 99);
  print('Encontrado: ${existing ?? 'no existe'}');
  print('No encontrado: ${missing ?? 'null'}');
}
