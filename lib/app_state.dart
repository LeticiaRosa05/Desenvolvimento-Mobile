import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _titulo = prefs.getStringList('ff_titulo') ?? _titulo;
    });
    _safeInit(() {
      _campo = prefs.getStringList('ff_campo') ?? _campo;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _titulo = [];
  List<String> get titulo => _titulo;
  set titulo(List<String> value) {
    _titulo = value;
    prefs.setStringList('ff_titulo', value);
  }

  void addToTitulo(String value) {
    titulo.add(value);
    prefs.setStringList('ff_titulo', _titulo);
  }

  void removeFromTitulo(String value) {
    titulo.remove(value);
    prefs.setStringList('ff_titulo', _titulo);
  }

  void removeAtIndexFromTitulo(int index) {
    titulo.removeAt(index);
    prefs.setStringList('ff_titulo', _titulo);
  }

  void updateTituloAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    titulo[index] = updateFn(_titulo[index]);
    prefs.setStringList('ff_titulo', _titulo);
  }

  void insertAtIndexInTitulo(int index, String value) {
    titulo.insert(index, value);
    prefs.setStringList('ff_titulo', _titulo);
  }

  List<String> _campo = [];
  List<String> get campo => _campo;
  set campo(List<String> value) {
    _campo = value;
    prefs.setStringList('ff_campo', value);
  }

  void addToCampo(String value) {
    campo.add(value);
    prefs.setStringList('ff_campo', _campo);
  }

  void removeFromCampo(String value) {
    campo.remove(value);
    prefs.setStringList('ff_campo', _campo);
  }

  void removeAtIndexFromCampo(int index) {
    campo.removeAt(index);
    prefs.setStringList('ff_campo', _campo);
  }

  void updateCampoAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    campo[index] = updateFn(_campo[index]);
    prefs.setStringList('ff_campo', _campo);
  }

  void insertAtIndexInCampo(int index, String value) {
    campo.insert(index, value);
    prefs.setStringList('ff_campo', _campo);
  }

  List<String> _selectedLists = [];
  List<String> get selectedLists => _selectedLists;
  set selectedLists(List<String> value) {
    _selectedLists = value;
  }

  void addToSelectedLists(String value) {
    selectedLists.add(value);
  }

  void removeFromSelectedLists(String value) {
    selectedLists.remove(value);
  }

  void removeAtIndexFromSelectedLists(int index) {
    selectedLists.removeAt(index);
  }

  void updateSelectedListsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedLists[index] = updateFn(_selectedLists[index]);
  }

  void insertAtIndexInSelectedLists(int index, String value) {
    selectedLists.insert(index, value);
  }

  bool _Pesquisa = false;
  bool get Pesquisa => _Pesquisa;
  set Pesquisa(bool value) {
    _Pesquisa = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
