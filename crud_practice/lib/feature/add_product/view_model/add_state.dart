part of 'add_bloc.dart';

@immutable
sealed class AddState {}

final class AddActionState extends AddState {}

final class AddInitial extends AddState {}

final class AddLoadingState extends AddState {}

final class AddProductSuccessState extends AddActionState {}

final class AddProductErrorState extends AddState {
  final String errorMessage;
  AddProductErrorState({required this.errorMessage});
}
