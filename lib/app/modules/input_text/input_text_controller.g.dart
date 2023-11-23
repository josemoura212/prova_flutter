// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_text_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InputTextController on InputTextControllerBase, Store {
  late final _$_inputTextAtom =
      Atom(name: 'InputTextControllerBase._inputText', context: context);

  List<String> get inputText {
    _$_inputTextAtom.reportRead();
    return super._inputText;
  }

  @override
  List<String> get _inputText => inputText;

  @override
  set _inputText(List<String> value) {
    _$_inputTextAtom.reportWrite(value, super._inputText, () {
      super._inputText = value;
    });
  }

  late final _$saveInputTextAsyncAction =
      AsyncAction('InputTextControllerBase.saveInputText', context: context);

  @override
  Future<void> saveInputText(String text) {
    return _$saveInputTextAsyncAction.run(() => super.saveInputText(text));
  }

  late final _$getInputTextAsyncAction =
      AsyncAction('InputTextControllerBase.getInputText', context: context);

  @override
  Future<void> getInputText() {
    return _$getInputTextAsyncAction.run(() => super.getInputText());
  }

  late final _$deleteInputTextAsyncAction =
      AsyncAction('InputTextControllerBase.deleteInputText', context: context);

  @override
  Future<void> deleteInputText(int index) {
    return _$deleteInputTextAsyncAction.run(() => super.deleteInputText(index));
  }

  late final _$editInputTextAsyncAction =
      AsyncAction('InputTextControllerBase.editInputText', context: context);

  @override
  Future<void> editInputText(String text, int index) {
    return _$editInputTextAsyncAction
        .run(() => super.editInputText(text, index));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
