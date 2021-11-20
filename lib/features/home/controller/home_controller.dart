import 'package:get/get.dart';
import 'package:weather_app/cores/utils/buttom_modal.dart';
import 'package:weather_app/features/home/views/widgets/bottom_sheet_widget.dart';

class HomeController {
  final RxString bottomSheetHeading = 'Forecast report'.obs;

  void openBottomSheet() {
    CustomBottomModalService.showModal(
      const BottomSheetWidget(),
    );
  }
}
