abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsGeneralLoadingState extends NewsStates {}

class NewsGeneralSuccessState extends NewsStates {}

class NewsGeneralErrorState extends NewsStates {
  final String error;

  NewsGeneralErrorState(this.error);
}

class NewsBusinessLoadingState extends NewsStates {}

class NewsBusinessSuccessState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  final String error;

  NewsBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsStates {}

class NewsSportsSuccessState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;

  NewsSportsErrorState(this.error);
}
class NewsHealthLoadingState extends NewsStates {}

class NewsHealthSuccessState extends NewsStates {}

class NewsHealthErrorState extends NewsStates {
  final String error;

  NewsHealthErrorState(this.error);
}

class NewsWorldLoadingState extends NewsStates {}

class NewsWorldSuccessState extends NewsStates {}

class NewsWorldErrorState extends NewsStates {
  final String error;

  NewsWorldErrorState(this.error);
}