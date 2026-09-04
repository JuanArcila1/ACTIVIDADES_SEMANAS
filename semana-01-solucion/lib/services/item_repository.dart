import '../models/item.dart';

class ItemRepository {
  Future<List<Item>> fetchItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));
    return [
      Item(id: 1, name: 'Café colombiano', createdAt: DateTime(2026, 1, 10), supplier: 'Andes Export', category: 'Alimentos'),
      Item(id: 2, name: 'Textiles de algodón', createdAt: DateTime(2026, 1, 12), supplier: 'Textil Andina', category: 'Textiles'),
      Item(id: 3, name: 'Electrónica industrial', createdAt: DateTime(2026, 2, 4), supplier: 'TechGlobal', category: 'Electrónica'),
      Item(id: 4, name: 'Repuestos automotrices', createdAt: DateTime(2026, 2, 18), supplier: 'AutoParts SAS', category: 'Repuestos'),
    ];
  }

  Item? findById(List<Item> items, int id) {
    for (final item in items) {
      if (item.id == id) return item;
    }
    return null;
  }
}
