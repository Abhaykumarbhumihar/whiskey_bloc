
// profile_image_event.dart

import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class ProfileImageEvent extends Equatable {
  const ProfileImageEvent();

  @override
  List<Object?> get props => [];
}

class ImageSelectedUploadEvent extends ProfileImageEvent {
  final File imagePath;

  const ImageSelectedUploadEvent(this.imagePath);

  @override
  List<Object?> get props => [imagePath];
}
