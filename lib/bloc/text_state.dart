part of 'text_bloc.dart';

@immutable
abstract class TextState {}

class TextInitial extends TextState {}

class TextChange extends TextState {
  String text;

  TextChange(this.text);
}
