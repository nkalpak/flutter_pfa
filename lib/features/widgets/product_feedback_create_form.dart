import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

import '../../main.dart';
import '../../material/dropdown_button_form_field.dart';
import '../../material/text_form_field.dart';
import '../../util/errors.dart';
import '../stores/product_feedback_store.dart';

class ProductFeedbackCreateForm extends StatefulWidget {
  const ProductFeedbackCreateForm({Key? key}) : super(key: key);

  @override
  _ProductFeedbackCreateFormState createState() =>
      _ProductFeedbackCreateFormState();
}

class _ProductFeedbackCreateFormState extends State<ProductFeedbackCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  String category = 'feature';

  void onCategoryChange(String? value) {
    setState(() {
      if (value != null) {
        category = value;
      }
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PfaTextFormField(
            controller: titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Errors.requiredField;
              }

              return null;
            },
            decoration: const InputDecoration(
                label: Text('Feedback Title'),
                helperText: 'Add a short, descriptive headline'),
          ),
          const SizedBox(
            height: 32,
          ),
          PfaDropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text('Category'),
                helperText: 'Choose a category for your feedback',
              ),
              value: category,
              items: ['feature', 'bug', 'enhancement']
                  .map((e) => DropdownMenuItem(
                        child: Text(e.toCapitalized()),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {
                onCategoryChange(value);
              }),
          const SizedBox(
            height: 32,
          ),
          PfaTextFormField(
            minLines: 2,
            controller: detailsController,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                label: Text('Feedback Detail'),
                helperText:
                    'Include any specific comments on what should be improved, added, etc.'),
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    productFeedbackStore.addProductFeedback(ProductFeedbackBase(
                        title: titleController.value.text,
                        category: category,
                        description: detailsController.value.text));
                    context.vRouter.to('/product-feedback');

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Successfully created ${titleController.value.text}')));
                  }
                },
                child: const Text('Create new feedback')),
          )
        ],
      ),
    );
  }
}
