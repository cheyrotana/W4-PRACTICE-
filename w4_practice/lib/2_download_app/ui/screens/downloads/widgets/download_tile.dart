import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    //TODO
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(controller.title),
            subtitle: Text(
              '${controller.percent.toStringAsFixed(2)}% completed - ${controller.downloadedSize.toStringAsFixed(2)} of ${controller.size} MB',
            ),
            trailing: IconButton(
              onPressed: controller.startDownload,
              icon: Icon(
                controller.status == DownloadStatus.downloading
                    ? Icons.downloading_rounded
                    : Icons.download_sharp,
              ),
            ),
          ),
        );
      },
    );
  }
}
