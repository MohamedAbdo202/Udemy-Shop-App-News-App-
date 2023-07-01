import '../ShopAppModel/ChangeFavouriteModel.dart';
import '../ShopAppModel/ModelshopLogin.dart';

abstract class ShopStats{}
class ShopInitialStats extends ShopStats{}
  class ShopBottomNavState extends ShopStats{}
class ShopLoadingDataState extends ShopStats{}

class ShopSuccessHomeDataState extends ShopStats{}

class ShopErrorHomeDataState extends ShopStats{}

class ShopSuccessCategoriesState extends ShopStats{}

class ShopErrorCategoriesState extends ShopStats{}

class ShopSuccessGetFavouritesState extends ShopStats{}

class ShopLoadingGetFavouritesState extends ShopStats{}

class ShopErrorGetFavouritesState extends ShopStats{}


class ShopChangeFavouritesState extends ShopStats{}

class ShopSuccessFavouritesState extends ShopStats
{
  final ChangeFavoritesModel model;
  ShopSuccessFavouritesState(this.model);
}

class ShopErrorFavouritesState extends ShopStats{}

class ShopSuccessUserDataState extends ShopStats{
  ShopLoginModel model;
  ShopSuccessUserDataState(this.model);
}

class ShopLoadingUserDataState extends ShopStats{}

class ShopErrorUserDataState extends ShopStats{}

class ShopSuccessUpdateDataState extends ShopStats{
  ShopLoginModel model;
  ShopSuccessUpdateDataState(this.model);
}

class ShopLoadingUpdateDataState extends ShopStats{}

class ShopErrorUpdateDataState extends ShopStats{}