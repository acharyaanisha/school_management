// import 'dart:io';

// import 'package:flutter/material.dart';

// class AppIcons {
//   static Icon arrowBack =
//       Platform.isIOS
//           ? const Icon(Icons.arrow_back_ios)
//           : const Icon(Icons.arrow_back);

//   static const Icon search = Icon(Icons.search);
// }

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppIcons {
  static Icon get arrowBack {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? const Icon(Icons.arrow_back_ios)
        : const Icon(Icons.arrow_back);
  }

  static const Icon search = Icon(Icons.search);
}
