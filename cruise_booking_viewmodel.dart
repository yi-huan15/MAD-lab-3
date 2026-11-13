import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

/// VIEWMODEL layer: holds app state + business logic.
/// The View listens to it and rebuilds whenever notifyListeners() is called.
class CruiseBookingViewModel extends ChangeNotifier {
  // ---- Data (Model) ----
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
        'Experience the heart of Sibu along Malaysia\'s longest river, the '
        'Rajang. Cruise past historic temples, timber hubs, and traditional '
        'waterfront settlements while experiencing authentic Sarawakian '
        'hospitality.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Tua_Pek_Kong_Temple_Sibu.jpg/1280px-Tua_Pek_Kong_Temple_Sibu.jpg',
    imageCaption: 'Sibu Esplanade Landmark',
    initialStarCount: 42,
  );

  final List<String> packages = const [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // ---- State ----
  late int _starCount = destination.initialStarCount;
  bool _isStarred = false;
  late DateTime _selectedDate = _today();
  late String _selectedPackage = packages.first;
  bool _isDarkMode = false;

  int get starCount => _starCount;
  bool get isStarred => _isStarred;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  DateTime get firstSelectableDate => _today();
  DateTime get lastSelectableDate => _today().add(const Duration(days: 365));

  /// dd/MM/yyyy
  String get formattedDate {
    final d = _selectedDate.day.toString().padLeft(2, '0');
    final m = _selectedDate.month.toString().padLeft(2, '0');
    return '$d/$m/${_selectedDate.year}';
  }

  // ---- Business logic ----
  void toggleStar() {
    _isStarred = !_isStarred;
    _starCount += _isStarred ? 1 : -1;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setPackage(String? package) {
    if (package == null) return;
    _selectedPackage = package;
    notifyListeners();
  }

  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  static DateTime _today() {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }
}
