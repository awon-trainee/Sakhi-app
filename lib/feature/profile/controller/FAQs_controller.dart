import 'package:get/get.dart';
import 'package:sakhi_app/feature/profile/model/FAQs_model.dart';

class FAQsController extends GetxController {
  late List<FAQsModel>? question;

  @override
  void onInit() {
    super.onInit();
    openQuestion();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void openQuestion() {
    question = [
      FAQsModel(
          header: 'first_question',
          body: 'first_question_content',
          isExpanded: false.obs),
      FAQsModel(
          header: 'seconed_question',
          body: 'seconed_question_content',
          isExpanded: false.obs),
    ];
    question?.toList().addAll(question!);
  }
}
