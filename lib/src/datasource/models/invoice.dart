// ignore_for_file: public_member_api_docs, sort_constructors_first
class Invoice {
  final List<LineItem> items;
  Invoice({
    required this.items,
  });
  double totalCost() {
    return items.fold(
        0, (previousValue, element) => previousValue + element.pu);
  }

  double totalItem() {
    return items.fold(0, (previousValue, element) => element.pu * element.qte);
  }
}

class LineItem {
  final String description;
  final double qte;
  final double pu;
  LineItem({
    required this.description,
    required this.qte,
    required this.pu,
  });
}
