import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  ImageDialog({@required this.image, @required this.onDelete});
  final dynamic image;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.file(image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 1.0, right: 1.0),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDelete();
                  },
                  child: const Text(
                    'Excluir',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
