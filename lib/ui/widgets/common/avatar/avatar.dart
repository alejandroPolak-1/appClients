import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tots_stacked_app/ui/common/app_colors.dart';

class Avatar extends StatelessWidget {
  final String? urlImage;
  final bool whitoutBorder;
  final double border;
  const Avatar({super.key, required this.urlImage, this.whitoutBorder = false, this.border = 30});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(

      borderType: BorderType.Circle,
      color:whitoutBorder 
          ? kcTransparent 
          : (urlImage != null ? kcColorDottedImage : kcTransparent),
      strokeWidth: 2, // Ancho del borde
      dashPattern: const [4, 4], // Patrón de rayas (longitud del dash y espacio)
      child:
    
    CircleAvatar(
      radius: border,
      
      backgroundImage: urlImage != null
          ? urlImage!.startsWith("http")
              ? NetworkImage(urlImage!)
              : FileImage(File(urlImage!))
          : null,
      child: urlImage == null
          ? Image.asset('assets/images/empty_image.png', fit: BoxFit.fill,)
          : null,
    )
    );
  }
}
