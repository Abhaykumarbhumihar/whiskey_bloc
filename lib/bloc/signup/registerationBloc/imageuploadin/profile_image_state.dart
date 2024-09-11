
// profile_image_state.dart

import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object?> get props => [];
}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageLoading extends ProfileImageState {
  final File imageUrl;
  const ProfileImageLoading(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class ProfileImageUploadSuccess extends ProfileImageState {
  final String imageUrl;

  const ProfileImageUploadSuccess(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class ProfileImageUploadError extends ProfileImageState {
  final String error;

  const ProfileImageUploadError(this.error);

  @override
  List<Object?> get props => [error];
}