class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

class AddProductLoadingState extends AddProductStates {}

class AddProducSuccessState extends AddProductStates {}

class AddProductFailedState extends AddProductStates {
  final String errMessage;

  AddProductFailedState({required this.errMessage});
}
