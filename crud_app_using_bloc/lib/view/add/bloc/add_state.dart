part of 'add_bloc.dart';

@immutable
sealed class AddState {}

final class AddActionState extends AddState {}

final class AddInitial extends AddState {}

final class AddLoadingState extends AddActionState {}

final class AddSuccessState extends AddState {}

final class AddErrorState extends AddState {
  final String errorMessage;

  AddErrorState({required this.errorMessage});
}

final class AddButtonState extends AddActionState {}
