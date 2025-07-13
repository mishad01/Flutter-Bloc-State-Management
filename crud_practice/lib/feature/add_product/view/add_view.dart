import 'package:crud_practice/core/theme/app_colors.dart';
import 'package:crud_practice/data/model/product/product_model.dart';
import 'package:crud_practice/feature/add_product/view_model/add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final AddBloc addBloc = AddBloc();
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _imgController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _qtyController = TextEditingController();
  final _totalPriceController = TextEditingController();
  final _createdDateController = TextEditingController();

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final product = ProductModel(
        productName: 'Sample Product',
        productCode: 'SP001',
        img: 'https://example.com/image.png',
        unitPrice: '100',
        qty: '2',
        totalPrice: '200',
        createdDate: '2025-06-27T00:00:00.000Z',
      );

      addBloc.add(AddProductEvent(product: product));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBloc, AddState>(
      bloc: addBloc,
      /*listenWhen: (previous, current) => current is AddActionState,
      buildWhen: (previous, current) => current is! AddActionState,*/
      listener: (context, state) {
        if (state is AddProductSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          _formKey.currentState?.reset();
          Navigator.pop(context);
        } else if (state is AddProductErrorState) {
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
          appBar: AppBar(title: const Text('Add Product')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildTextField(
                      label: 'Product Name', controller: _nameController),
                  const SizedBox(height: 12),
                  _buildTextField(
                      label: 'Product Code', controller: _codeController),
                  const SizedBox(height: 12),
                  _buildTextField(
                      label: 'Image URL', controller: _imgController),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Unit Price',
                    controller: _unitPriceController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Quantity',
                    controller: _qtyController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: 'Total Price',
                    controller: _totalPriceController,
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                      label: 'Created Date',
                      controller: _createdDateController),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is AddLoadingState ? null : _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appThemeColor,
                    ),
                    child: state is AddLoadingState
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Add Product",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              ),
            ),
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
