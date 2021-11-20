import 'package:weather_app/cores/utils/buttom_modal.dart';
import 'package:weather_app/features/home/views/widgets/forecast_report_widget.dart';

class HomeController {
  void openBottomSheet() {
    CustomBottomModalService.showModal(
      const ForecastReportWidget(),
      
    );
  }
}
