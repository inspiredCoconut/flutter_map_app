import '../data/models/user_model.dart';
import '../data/repositories/user_repository.dart';

/// Interface that HomeView implements to receive updates from Presenter
abstract class HomeViewContract {
  void showLoading();
  void hideLoading();
  void showUsers(List<UserModel> users);
  void showError(String message);
}

class HomePresenter {
  final HomeViewContract _view;
  final UserRepository _userRepository;

  HomePresenter(this._view, this._userRepository);

  void loadUsers() async {
    _view.showLoading(); // Tell View to show loading indicator

    try {
      List<UserModel> users = await _userRepository.getUsers();
      _view.showUsers(users); // Pass data to View
    } catch (e) {
      _view.showError("Failed to load users");
    } finally {
      _view.hideLoading(); // Hide loading indicator
    }
  }
}
