import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/shared/widgets/custom_button.dart';
import '../../../../../../core/utils/dimensions.dart';
import '../../domain/entities/add_product_entity.dart';
import '../../domain/use_cases/add_product_usecase.dart';

part 'add_product_state.dart';

part 'add_product_cubit.freezed.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit({required this.addProductUseCase})
      : super(const AddProductStates.initial());

  static AddProductCubit get(BuildContext context) => BlocProvider.of(context);

  final AddProductUseCase addProductUseCase;

  addDesignerProduct(AddProductEntity addProductEntity) async {
    emit(const AddProductStates.loading());
    final add = await addProductUseCase(addProductEntity);

    add.fold(
      (l) {
        emit(
          AddProductStates.error(
            l.code.toString(),
            l.message,
          ),
        );
      },
      (r) async {
        emit(
          AddProductStates.success(r),
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

    AddProductStates.uploadImage(img);
  }

  List<File> selectedImages =
      []; // List of selected image// Instance of Image picker
  List<String> base64Images = [];

  getImages(context) async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xFilePick = pickedFile;

    // if atleast 1 images is selected it will add
    // all images in selectedImages
    // variable so that we can easily show them in UI
    if (xFilePick.isNotEmpty) {
      for (var i = 0; i < xFilePick.length; i++) {
        selectedImages.add(File(xFilePick[i].path));
        base64Images
            .add(base64Encode(File(xFilePick[i].path).readAsBytesSync()));
      }
      AddProductStates.uploadMultipleImages(xFilePick);
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
}
