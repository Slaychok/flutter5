// Модель данных, представляющая одну трату
class Expense {
  final String id;
  final String title; // Краткое название (например, "Продукты в Пятерочке")
  final double amount; // Сумма расхода
  final DateTime date; // Дата расхода
  final String category; // Категория (еда, транспорт, etc.)
  final String? description; // Подробное описание (необязательно)

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    this.description,
  });

  // Метод для создания копии объекта с измененными полями (очень полезно!)
  Expense copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    String? category,
    String? description,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}