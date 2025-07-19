import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_bloc/bloc/image_picker_event.dart';
import 'package:image_picker_bloc/bloc/image_picker_states.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker')),
      body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
        builder: (context, state) {
          if (state.file == null) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(CameraCapture());
                    },
                    child: CircleAvatar(child: Icon(Icons.camera)),
                  ),
                  SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      context.read<ImagePickerBloc>().add(GalleryPicker());
                    },
                    child: CircleAvatar(child: Icon(Icons.browse_gallery)),
                  ),
                ],
              ),
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        },
      ),
    );
  }
}
