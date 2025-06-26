import 'package:crud_app_using_bloc/core/theme/app_colors.dart';
import 'package:crud_app_using_bloc/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_bloc.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final AddBloc addBloc = AddBloc();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _createdDateController = TextEditingController();

  Widget _buildTextField(
      {required String label, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'Enter $label' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBloc, AddState>(
      bloc: addBloc,
      listenWhen: (previous, current) => current is AddActionState,
      buildWhen: (previous, current) => true, // Allow all states to rebuild
      listener: (context, state) {
        if (state is AddSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Item added to product',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ));
          // Clear form after success
          _formKey.currentState?.reset();
          Navigator.pop(context); // Close the add screen
        } else if (state is AddErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Add Product')),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildTextField(
                          label: 'Product Name', controller: _nameController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Product Code', controller: _codeController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Image URL', controller: _imgController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Unit Price',
                          controller: _unitPriceController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Quantity', controller: _qtyController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Total Price',
                          controller: _totalPriceController),
                      SizedBox(height: 12),
                      _buildTextField(
                          label: 'Created Date',
                          controller: _createdDateController),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: state is AddLoadingState
                            ? null // Disable button when loading
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  final product = ProductModel(
                                    productName: _nameController.text.trim(),
                                    productCode: _codeController.text.trim(),
                                    img: _imgController.text.trim(),
                                    unitPrice: _unitPriceController.text.trim(),
                                    qty: _qtyController.text.trim(),
                                    totalPrice:
                                        _totalPriceController.text.trim(),
                                    createdDate:
                                        _createdDateController.text.trim(),
                                  );
                                  addBloc.add(AddProductEvent(product));
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.appThemeColor,
                        ),
                        child: state is AddLoadingState
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.lightBackground,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Add Product",
                                style: TextStyle(
                                  color: AppColors.lightBackground,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _imgController.dispose();
    _unitPriceController.dispose();
    _qtyController.dispose();
    _totalPriceController.dispose();
    _createdDateController.dispose();
    super.dispose();
  }
}
