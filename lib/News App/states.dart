abstract class NewStates{}
class Newinitstates extends NewStates{}
class bottomstates extends NewStates{}

class NewGetBusinessSuccesState extends NewStates{}
class NewGetBusinessloadingState extends NewStates{}
class NewGetBusinessErrorState extends NewStates{

   String error;
  NewGetBusinessErrorState(this.error);
}
class NewGetScienceSuccesState extends NewStates{}
class NewGetScienceloadingState extends NewStates{}
class NewGetScienceErrorState extends NewStates{

  String error;
  NewGetScienceErrorState(this.error);
}
class NewGetSportsSuccesState extends NewStates{}
class NewGetSportsloadingState extends NewStates{}
class NewGetSportsErrorState extends NewStates{

  String error;
  NewGetSportsErrorState(this.error);
}


class NewGetSearchSuccesState extends NewStates{}
class NewGetSearchloadingState extends NewStates{}
class NewGetSearchErrorState extends NewStates{

  String error;
  NewGetSearchErrorState(this.error);
}