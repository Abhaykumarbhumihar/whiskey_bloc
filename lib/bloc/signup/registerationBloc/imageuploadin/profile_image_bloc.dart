import 'dart:convert';

import 'package:bloc/bloc.dart';
// profile_image_bloc.dart
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../../../UI/intropage/auth_repository.dart';
import '../../../../untils/widget/commonUtility.dart';
import '../../../../webfile/appConstant.dart';
import 'profile_image_event.dart';
import 'profile_image_state.dart';

class ProfileImageBloc extends Bloc<ProfileImageEvent, ProfileImageState> {
  ProfileImageBloc() : super(ProfileImageInitial()) {
    on<ImageSelectedUploadEvent>(uploadImage);
  }

  Future<void>uploadImage(ImageSelectedUploadEvent event,Emitter<ProfileImageState>emit)async{

    if (await CommonUtility.isInternetConnected()) {
      emit(ProfileImageLoading(event.imagePath));
      try{
        dynamic uploadImageData =
        await AuthRepository.imageUpload(event.imagePath, AppConstant.UPLOADPROFILEPIC);


        var data = json.decode(uploadImageData.body);
        print(data['data']);
        emit(ProfileImageUploadSuccess(data['data']));
      }catch(e){
        emit(ProfileImageUploadError(e.toString()));
      }
    } else {
      emit(ProfileImageUploadError(AppConstant.INTERNETCCONNECTIONS));
    }
  }
}
