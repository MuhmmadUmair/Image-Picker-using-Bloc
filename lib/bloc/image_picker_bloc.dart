import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_bloc/bloc/image_picker_states.dart';
import 'package:image_picker_bloc/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryPicker>(galleryPicker);
  }

  void cameraCapture(
    CameraCapture event,
    Emitter<ImagePickerStates> states,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(file: file));
  }

  void galleryPicker(
    GalleryPicker event,
    Emitter<ImagePickerStates> states,
  ) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(state.copyWith(file: file));
  }
}
