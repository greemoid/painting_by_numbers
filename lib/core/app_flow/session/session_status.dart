/// Represents the current authentication status of the user.
enum SessionStatus {
  /// User is signed in.
  authenticated,

  /// User is not signed in.
  unauthenticated,

  /// Initial state before checking auth.
  unknown,

  /// User is authenticated but hasn't verified their email.
  unverified,
}
