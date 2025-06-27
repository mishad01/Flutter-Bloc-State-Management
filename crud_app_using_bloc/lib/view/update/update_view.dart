import 'package:crud_app_using_bloc/core/theme/app_colors.dart';
import 'package:crud_app_using_bloc/model/product_model.dart';
import 'package:crud_app_using_bloc/view/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({
    super.key,
    required this.name,
    required this.code,
    required this.img,
    required this.unitPrice,
    required this.qty,
    required this.totalPrice,
    required this.createdDate,
    required this.sId,
  });

  final String name, code, img, unitPrice, qty, totalPrice, createdDate, sId;

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  late final ProductBloc productBloc = ProductBloc();
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController =
      TextEditingController(text: widget.name);
  late final TextEditingController _codeController =
      TextEditingController(text: widget.code);
  late final TextEditingController _imgController =
      TextEditingController(text: widget.img);
  late final TextEditingController _unitPriceController =
      TextEditingController(text: widget.unitPrice);
  late final TextEditingController _qtyController =
      TextEditingController(text: widget.qty);
  late final TextEditingController _totalPriceController =
      TextEditingController(text: widget.totalPrice);
  late final TextEditingController _createdDateController =
      TextEditingController(text: widget.createdDate);

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
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => true,
      listener: (context, state) {
        if (state is ProductUpdateSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Item updated successfully',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
          ));
          Navigator.pop(context);
        } else if (state is ProductErrorState) {
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
          appBar: AppBar(title: Text('Update Product')),
          body: Padding(
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
                      label: 'Unit Price', controller: _unitPriceController),
                  SizedBox(height: 12),
                  _buildTextField(
                      label: 'Quantity', controller: _qtyController),
                  SizedBox(height: 12),
                  _buildTextField(
                      label: 'Total Price', controller: _totalPriceController),
                  SizedBox(height: 12),
                  _buildTextField(
                      label: 'Created Date',
                      controller: _createdDateController),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is ProductLoadingState
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              final product = ProductModel(
                                sId: widget.sId,
                                productName: _nameController.text.trim(),
                                productCode: _codeController.text.trim(),
                                img: _imgController.text.trim(),
                                unitPrice: _unitPriceController.text.trim(),
                                qty: _qtyController.text.trim(),
                                totalPrice: _totalPriceController.text.trim(),
                                createdDate: _createdDateController.text.trim(),
                              );
                              productBloc
                                  .add(ProductUpdateEvent(product, widget.sId));
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appThemeColor,
                    ),
                    child: state is ProductLoadingState
                        ? CircularProgressIndicator(
                            color: AppColors.lightBackground, strokeWidth: 2)
                        : Text(
                            "Update Product",
                            style: TextStyle(color: AppColors.lightBackground),
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
}
