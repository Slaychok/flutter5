import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../screens/expenses_list_screen.dart';
import '../screens/expense_form_screen.dart';

enum Screen { list, form }

class ExpensesContainer extends StatefulWidget {
  const ExpensesContainer({super.key});

  @override
  State<ExpensesContainer> createState() => _ExpensesContainerState();
}

class _ExpensesContainerState extends State<ExpensesContainer> {
  final List<Expense> _expenses = [];
  Screen _currentScreen = Screen.list;

  void _showList() {
    setState(() => _currentScreen = Screen.list);
  }

  void _showForm() {
    setState(() => _currentScreen = Screen.form);
  }

  void _addExpense({
    required String title,
    required double amount,
    required DateTime date,
    required String category,
    String? description,
  }) {
    setState(() {
      final newExpense = Expense(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: title,
        amount: amount,
        date: date,
        category: category,
        description: description,
      );
      _expenses.add(newExpense);
      // Сортируем по дате (сначала новые)
      _expenses.sort((a, b) => b.date.compareTo(a.date));
      _currentScreen = Screen.list; // Возврат к списку после добавления
    });
  }

  void _deleteExpense(String id) {
    setState(() {
      _expenses.removeWhere((expense) => expense.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case Screen.list:
        return ExpensesListScreen(
          expenses: _expenses,
          onAdd: _showForm,
          onDelete: _deleteExpense,
          // onTap можно использовать для редактирования
        );
      case Screen.form:
        return ExpenseFormScreen(
          onSave: _addExpense,
          onCancel: _showList,
        );
    }
  }
}