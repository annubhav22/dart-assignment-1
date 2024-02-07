mixin Authenticator {
  bool authenticate(String username, String password) {
    // implimenting authentication logic
    return true;
  }
}

mixin AuthorizationManager {
  bool authorize(String role, String resource) {
    // Here you can implement your authorization logic
    // For demonstration, let's say only users with 'admin' role have access to all resources
    if (role == 'admin') {
      return true;
    }
    // For other roles, access is denied
    return false;
  }
}

class User with Authenticator, AuthorizationManager {
  String username;
  String role;

  User(this.username, this.role);

  // Method to perform login
  bool login(String password) {
    // Perform authentication
    bool isAuthenticated = authenticate(username, password);
    if (isAuthenticated) {
      print('User $username authenticated successfully!');
      return true;
    } else {
      print('Authentication failed for user $username');
      return false;
    }
  }
  bool checkAccess(String resource) {
    bool isAuthorized = authorize(role, resource);
    if (isAuthorized) {
      print('User $username has access to $resource');
      return true;
    } else {
      print('Access denied for user $username to $resource');
      return false;
    }
  }
}

void main() {
  
  var user = User('john_doe', 'admin');

  
  user.login('password123');

 
  user.checkAccess('admin_dashboard');
}
