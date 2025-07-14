import 'dart:io';

import 'package:cubit_counter_app/cubit/image_picker/image_cubit.dart';
import 'package:cubit_counter_app/cubit/image_picker/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image picker using cubit")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is ImageInitialState) {
              return Column(
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Icon(Icons.account_circle_sharp, size: 150),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ImageCubit>().pickImage();
                    },
                    child: Text("Picked Image"),
                  ),
                ],
              );
            } else if (state is ImageLoadedState) {
              return Center(
                child: Column(
                  children: [
                    Image.file(File(state.imagePath)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ImageCubit>().reset();
                      },
                      child: Text("Pick Another Image"),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
