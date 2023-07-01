
import '../../../ShopAppModel/SearchModel.dart';

abstract class SearchStates{}

class ShopSearchInitialState extends SearchStates{}

class ShopSearchLoadingState extends SearchStates{}

class ShopSearchSuccessState extends SearchStates{
  final SearchModel model;
  ShopSearchSuccessState(this.model);

}

class ShopSearchErrorState extends SearchStates
{
  final String error;
  ShopSearchErrorState(this.error);
}