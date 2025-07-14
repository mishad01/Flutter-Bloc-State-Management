import 'package:cubit_counter_app/cubit/image_picker/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitialState());

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedImage != null) {
        emit(ImageLoadedState(pickedImage.path));
      } else {
        emit(ImageErrorState(errorMessage: "No Image selected"));
      }
    } catch (e) {
      emit(ImageErrorState(errorMessage: e.toString()));
    }
  }

  void reset() {
    emit(ImageInitialState());
  }
}
