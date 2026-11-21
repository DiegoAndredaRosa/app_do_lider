import 'package:flutter/material.dart'
    show ChangeNotifier, Color, Colors, VoidCallback;
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/app_utils.dart';
import 'dart:convert';

class AppState extends ChangeNotifier {
  static AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  static void reset() {
    _instance = AppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<DTlistaMembrosStruct> _listaMembrosState = [];
  List<DTlistaMembrosStruct> get listaMembrosState => _listaMembrosState;
  set listaMembrosState(List<DTlistaMembrosStruct> value) {
    _listaMembrosState = value;
  }

  void addToListaMembrosState(DTlistaMembrosStruct value) {
    listaMembrosState.add(value);
  }

  void removeFromListaMembrosState(DTlistaMembrosStruct value) {
    listaMembrosState.remove(value);
  }

  void removeAtIndexFromListaMembrosState(int index) {
    listaMembrosState.removeAt(index);
  }

  void updateListaMembrosStateAtIndex(
    int index,
    DTlistaMembrosStruct Function(DTlistaMembrosStruct) updateFn,
  ) {
    listaMembrosState[index] = updateFn(_listaMembrosState[index]);
  }

  void insertAtIndexInListaMembrosState(int index, DTlistaMembrosStruct value) {
    listaMembrosState.insert(index, value);
  }

  int _contadorlistaMembrosChamada = -1;
  int get contadorlistaMembrosChamada => _contadorlistaMembrosChamada;
  set contadorlistaMembrosChamada(int value) {
    _contadorlistaMembrosChamada = value;
  }

  String _statusPresenca = '';
  String get statusPresenca => _statusPresenca;
  set statusPresenca(String value) {
    _statusPresenca = value;
  }

  int _RadioSelecionadoId = 0;
  int get RadioSelecionadoId => _RadioSelecionadoId;
  set RadioSelecionadoId(int value) {
    _RadioSelecionadoId = value;
  }

  DTdashdadosStruct _dashDadosState = DTdashdadosStruct();
  DTdashdadosStruct get dashDadosState => _dashDadosState;
  set dashDadosState(DTdashdadosStruct value) {
    _dashDadosState = value;
  }

  void updateDashDadosStateStruct(Function(DTdashdadosStruct) updateFn) {
    updateFn(_dashDadosState);
  }

  List<dynamic> _dashMembrospGRJSON = [];
  List<dynamic> get dashMembrospGRJSON => _dashMembrospGRJSON;
  set dashMembrospGRJSON(List<dynamic> value) {
    _dashMembrospGRJSON = value;
  }

  void addToDashMembrospGRJSON(dynamic value) {
    dashMembrospGRJSON.add(value);
  }

  void removeFromDashMembrospGRJSON(dynamic value) {
    dashMembrospGRJSON.remove(value);
  }

  void removeAtIndexFromDashMembrospGRJSON(int index) {
    dashMembrospGRJSON.removeAt(index);
  }

  void updateDashMembrospGRJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashMembrospGRJSON[index] = updateFn(_dashMembrospGRJSON[index]);
  }

  void insertAtIndexInDashMembrospGRJSON(int index, dynamic value) {
    dashMembrospGRJSON.insert(index, value);
  }

  List<dynamic> _dashRankingMembrosJSON = [];
  List<dynamic> get dashRankingMembrosJSON => _dashRankingMembrosJSON;
  set dashRankingMembrosJSON(List<dynamic> value) {
    _dashRankingMembrosJSON = value;
  }

  void addToDashRankingMembrosJSON(dynamic value) {
    dashRankingMembrosJSON.add(value);
  }

  void removeFromDashRankingMembrosJSON(dynamic value) {
    dashRankingMembrosJSON.remove(value);
  }

  void removeAtIndexFromDashRankingMembrosJSON(int index) {
    dashRankingMembrosJSON.removeAt(index);
  }

  void updateDashRankingMembrosJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashRankingMembrosJSON[index] = updateFn(_dashRankingMembrosJSON[index]);
  }

  void insertAtIndexInDashRankingMembrosJSON(int index, dynamic value) {
    dashRankingMembrosJSON.insert(index, value);
  }

  List<dynamic> _dashtoppresencaJSON = [];
  List<dynamic> get dashtoppresencaJSON => _dashtoppresencaJSON;
  set dashtoppresencaJSON(List<dynamic> value) {
    _dashtoppresencaJSON = value;
  }

  void addToDashtoppresencaJSON(dynamic value) {
    dashtoppresencaJSON.add(value);
  }

  void removeFromDashtoppresencaJSON(dynamic value) {
    dashtoppresencaJSON.remove(value);
  }

  void removeAtIndexFromDashtoppresencaJSON(int index) {
    dashtoppresencaJSON.removeAt(index);
  }

  void updateDashtoppresencaJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashtoppresencaJSON[index] = updateFn(_dashtoppresencaJSON[index]);
  }

  void insertAtIndexInDashtoppresencaJSON(int index, dynamic value) {
    dashtoppresencaJSON.insert(index, value);
  }

  List<dynamic> _dashMenosPresencaJSON = [];
  List<dynamic> get dashMenosPresencaJSON => _dashMenosPresencaJSON;
  set dashMenosPresencaJSON(List<dynamic> value) {
    _dashMenosPresencaJSON = value;
  }

  void addToDashMenosPresencaJSON(dynamic value) {
    dashMenosPresencaJSON.add(value);
  }

  void removeFromDashMenosPresencaJSON(dynamic value) {
    dashMenosPresencaJSON.remove(value);
  }

  void removeAtIndexFromDashMenosPresencaJSON(int index) {
    dashMenosPresencaJSON.removeAt(index);
  }

  void updateDashMenosPresencaJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashMenosPresencaJSON[index] = updateFn(_dashMenosPresencaJSON[index]);
  }

  void insertAtIndexInDashMenosPresencaJSON(int index, dynamic value) {
    dashMenosPresencaJSON.insert(index, value);
  }

  List<dynamic> _dashProxAniverJSON = [];
  List<dynamic> get dashProxAniverJSON => _dashProxAniverJSON;
  set dashProxAniverJSON(List<dynamic> value) {
    _dashProxAniverJSON = value;
  }

  void addToDashProxAniverJSON(dynamic value) {
    dashProxAniverJSON.add(value);
  }

  void removeFromDashProxAniverJSON(dynamic value) {
    dashProxAniverJSON.remove(value);
  }

  void removeAtIndexFromDashProxAniverJSON(int index) {
    dashProxAniverJSON.removeAt(index);
  }

  void updateDashProxAniverJSONAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dashProxAniverJSON[index] = updateFn(_dashProxAniverJSON[index]);
  }

  void insertAtIndexInDashProxAniverJSON(int index, dynamic value) {
    dashProxAniverJSON.insert(index, value);
  }
}
