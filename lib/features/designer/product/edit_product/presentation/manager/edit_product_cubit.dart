import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';

import 'package:image_picker/image_picker.dart';
import 'package:marketc/core/utils/dimensions.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../domain/entities/edit_product_entity.dart';
import '../../domain/use_cases/edit_product_usecase.dart';

part 'edit_product_state.dart';

part 'edit_product_cubit.freezed.dart';

class EditProductCubit extends Cubit<EditProductStates> {
  EditProductCubit({required this.editProductUseCase})
      : super(const EditProductStates.initial());

  static EditProductCubit get(BuildContext context) => BlocProvider.of(context);

  final EditProductUseCase editProductUseCase;

  editDesignerProduct(EditProductEntity editProductEntity) async {
    emit(const EditProductStates.loading());
    final edit = await editProductUseCase(editProductEntity);

    edit.fold(
      (l) {
        emit(
          EditProductStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          EditProductStates.success(r),
        );
      },
    );
  }

  XFile? image;
  String base64Image = '';
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    File? pickedImage = File(img!.path);
    base64Image = base64Encode(pickedImage.readAsBytesSync());
    image = img;

    EditProductStates.uploadImage(img);
  }

  List<File> selectedImages = [];
  List<XFile> xFilePick = [];
  List<String> base64Images = [];

  getImages(context) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    xFilePick.addAll(pickedFile);

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xFilePick.isNotEmpty) {
      for (var i = 0; i < xFilePick.length; i++) {
        selectedImages.add(File(xFilePick[i].path));
        base64Images
            .add(base64Encode(File(xFilePick[i].path).readAsBytesSync()));
      }
      emit(EditProductStates.uploadMultipleImages(base64Images));
    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      context.defaultSnackBar("Nothing is selected");
    }
  }

  Future<void> requestPermission() async {
    const permission = Permission.camera;

    if (await permission.isDenied) {
      await permission.request();
    }
  }

  void pickPhotoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.p8,
            ),
          ),
          title: const Text("Pick Image"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomBtn(
                label: "From Gallery",
                onPressed: () {
                  Navigator.pop(context);
                  getImages(context);
                },
              ),
              Gap(10.h),
              CustomBtn(
                label: "From Camera",
                onPressed: () {
                  Navigator.pop(context);
                  getImages(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /*Future<String?> networkImageToBase64(String? imageUrl) async {
    http.Response response = await http.get(Uri.parse(imageUrl!));
    final bytes = response.bodyBytes;
    return base64Encode(bytes);
  }*/

  // List<String> base64Preview = [];

  // previewImages(List<ProductsImagesEntity> images) async {
  //   for (var image in images) {
  //     String? base64 =
  //         await networkImageToBase64(AppConstants.imageUrl + image.image!);
  //     base64Preview.add(base64!);
  //     debugPrint(base64Preview.toString());
  //   }
  //   emit(EditProductStates.previewImages(base64Preview));
  // }
}
