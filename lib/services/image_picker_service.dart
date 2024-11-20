import 'package:image_picker/image_picker.dart';

class ImagePickerService {
// Singleton instance
  static final ImagePickerService _instance = ImagePickerService._internal();

  // Private constructor to prevent instantiation
  ImagePickerService._internal();

  // Public accessor to the singleton instance
  factory ImagePickerService() => _instance;

  final ImagePicker _picker = ImagePicker();

  // Método para seleccionar una imagen desde la galería
  Future<XFile?> pickImageFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  // Método para tomar una foto con la cámara
  Future<XFile?> takePhoto() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  // Método para seleccionar un video desde la galería
  Future<XFile?> pickVideoFromGallery() async {
    return await _picker.pickVideo(source: ImageSource.gallery);
  }

  // Método para grabar un video con la cámara
  Future<XFile?> recordVideo() async {
    return await _picker.pickVideo(source: ImageSource.camera);
  }
}
