import 'dart:io';
import 'package:e_commerce_dash_board_app/Core/widgets/custom_button.dart';
import 'package:e_commerce_dash_board_app/Core/widgets/custom_text_field.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Etities/add_product_entity.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/View_model/Add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/Views/widgets/image_field.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Presentation/Views/widgets/is_featured_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String name, code, description, categoryName;
  late num price;
  File? image;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  categoryName = value!;
                },
                hintText: 'Category Name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              /*CustomTextFormField(
                onSaved: (value) {
                  expirationMonths = num.parse(value!);
                },
                hintText: 'Expiration Months',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
                hintText: 'Number Of Calories',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  unitAmount = num.parse(value!);
                },
                hintText: 'Unit Amont',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),*/
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 16,
              ),
              /*IsOrganciCheckBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),*/
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFavorite = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      /* ProductEntity input = ProductEntity(
                        name: name,
                        reviews: [
                          ReviewEntity(
                            name: 'tharwat',
                            image:
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&psig=AOvVaw19xjUBre0RXfV2IZ-cEAEV&ust=1726749821993000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCJ3L_CzIgDFQAAAAAdAAAAABAE',
                            ratting: 5,
                            date: DateTime.now().toIso8601String(),
                            reviewDescription: 'Nice product',
                          )
                        ],
                        isOrganic: isOrganic,
                        code: code,
                        description: description,
                        expirationsMonths: expirationMonths.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                      );

                      context.read<AddProductCubit>().addProduct(input);

                      */

                      AddProductEntity input = AddProductEntity(
                          name: name,
                          price: price,
                          code: code,
                          description: description,
                          category: categoryName,
                          isFavotite: isFavorite,
                          image: image);

                      context
                          .read<AddProductCubit>()
                          .AddProductCubitMethod(addProductEntity: input);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
                text: 'Add Product',
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
