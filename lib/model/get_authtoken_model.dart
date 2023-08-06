class GetAuthTokenModel {
  final String kind;
  final String localId;
  final String email;
  final String displayName;
  final String idToken;
  final bool registered;
  final String refreshToken;
  final String expiresIn;

  GetAuthTokenModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory GetAuthTokenModel.fromJson( json) {
    return GetAuthTokenModel(
      kind: json['kind'],
      localId: json['localId'],
      email: json['email'],
      displayName: json['displayName'],
      idToken: json['idToken'],
      registered: json['registered'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
    );
  }
}
