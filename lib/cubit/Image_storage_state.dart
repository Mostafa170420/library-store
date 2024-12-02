import 'dart:typed_data';

abstract class ImageStorageStates {}

class InitialState extends ImageStorageStates {}

class ImagePickedState extends ImageStorageStates {
  Uint8List web;
  ImagePickedState({required this.web});
}

class FailedState extends ImageStorageStates {}

class LoadingState extends ImageStorageStates {}

class SuccessState extends ImageStorageStates {}
