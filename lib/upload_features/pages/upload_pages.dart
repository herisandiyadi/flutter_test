import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:test_flutter/constants/styles.dart';
import 'package:test_flutter/upload_features/pages/widgets/loading.dart';
import 'package:test_flutter/upload_features/viewmodels/cubit/upload_cubit.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final picker = ImagePicker();
  File? _image;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getGalery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final LoadingWidget loadingWidget = LoadingWidget();
    return Scaffold(
      backgroundColor: whiteColor,
      body: BlocListener<UploadCubit, UploadState>(
        listener: (context, state) {
          if (state is UploadLoading) {
            loadingWidget.loading(true, context);
          } else if (state is UploadLoaded) {
            loadingWidget.loading(false, context);
            QuickAlert.show(
              context: context,
              title: 'Upload Success',
              type: QuickAlertType.success,
            );
            setState(() {
              _image = null;
            });
          } else if (state is UploadFailed) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Failed',
              text: state.messages,
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: _image == null
                  ? const Text('No image selected.')
                  : Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(30),
                            height: 500,
                            width: 300,
                            child: Image.file(_image!)),
                        Positioned(
                            top: 30,
                            right: 30,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _image = null;
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: redColor,
                                  size: 30,
                                )))
                      ],
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: getImage,
                  child: const Text('Camera'),
                ),
                ElevatedButton(
                  onPressed: getGalery,
                  child: const Text('Galery'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            _image != null
                ? ElevatedButton(
                    onPressed: () {
                      final uploadCubit = context.read<UploadCubit>();
                      uploadCubit.uploadFile(_image!);
                    },
                    child: const Text('Upload Image'),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(greyColor)),
                    onPressed: null,
                    child: const Text('Upload Image'),
                  )
          ],
        ),
      ),
    );
  }
}
