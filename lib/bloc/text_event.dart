part of 'text_bloc.dart';

@immutable
abstract class TextEvent {}

class TextChangeEvent extends TextEvent {
  String text;

  TextChangeEvent(this.text);
}
