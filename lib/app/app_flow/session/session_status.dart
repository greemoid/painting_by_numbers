/// Represents the current authentication status of the user.
enum SessionStatus {
  /// Initial state before checking auth.
  unknown,

  /// User is signed in (Firebase Auth).
  authenticated,

  /// User is not signed in.
  unauthenticated,
}
