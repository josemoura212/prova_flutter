import 'package:mobx/mobx.dart';
import 'package:prova_flutter/app/core/constantes/constantes.dart';
import 'package:prova_flutter/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
part 'input_text_controller.g.dart';

class InputTextController = InputTextControllerBase with _$InputTextController;

abstract class InputTextControllerBase with Store {
  final localStorage = SharedPreferencesLocalStorageImpl();
  @readonly
  // ignore: prefer_final_fields
  var _inputText = <String>[].asObservable();

  @action
  Future<void> saveInputText(String text, int? index) async {
    if (index != null) {
      editInputText(text, index);
    } else {
      _inputText.add(text);
      await localStorage.write<List<String>>(
          Constantes.localStorageKey, _inputText);
    }
  }

  @action
  Future<void> getInputText() async {
    _inputText.clear();
    final list =
        await localStorage.read<List<String>>(Constantes.localStorageKey) ?? [];
    _inputText.addAll(list);
  }

  @action
  Future<void> deleteInputText(int index) async {
    _inputText.removeAt(index);
    await localStorage.write<List<String>>(
        Constantes.localStorageKey, _inputText);
    getInputText();
  }

  @action
  Future<void> editInputText(String text, int index) async {
    _inputText[index] = text;
    await localStorage.write<List<String>>(
        Constantes.localStorageKey, _inputText);
    getInputText();
  }
}
