import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/create/components/image_dialog.dart';
import 'package:xlo_clone/screens/create/components/image_source_modal.dart';
import 'package:xlo_clone/stores/create_store.dart';

class ImagesField extends StatelessWidget {
  ImagesField(this.createStore);
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStore.images.add(image);
      Navigator.of(context).pop();
    }

    return Container(
      color: Colors.grey[200],
      height: 120,
      child: Observer(builder: (_) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:
              createStore.images.length < 5 ? createStore.images.length + 1 : 5,
          itemBuilder: (_, index) {
            if (index == createStore.images.length)
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => ImageSourceModal(onImageSelected),
                      );
                    } else {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => ImageSourceModal(onImageSelected),
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            else
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  8,
                  16,
                  index == 4 ? 8 : 0,
                  16,
                ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => ImageDialog(
                        image: createStore.images[index],
                        onDelete: () => createStore.images.removeAt(index),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage: FileImage(createStore.images[index]),
                  ),
                ),
              );
          },
        );
      }),
    );
  }
}
