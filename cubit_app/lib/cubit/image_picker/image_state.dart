abstract class ImageState {}

final class ImageInitialState extends ImageState {}

final class ImageLoadedState extends ImageState {
  final String imagePath;
  ImageLoadedState(this.imagePath);
}

final class ImageErrorState extends ImageState {
  final String errorMessage;
  ImageErrorState({required this.errorMessage});
}
