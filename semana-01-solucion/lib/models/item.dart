class Item {
  final int id;
  final String name;
  final DateTime createdAt;
  final String supplier;
  final String category;

  const Item({required this.id, required this.name, required this.createdAt, required this.supplier, required this.category});

  @override
  String toString() => '#$id $name | proveedor: $supplier | categoría: $category';
}
