class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      email: map['email'] ?? 'email não encontrado',
      firstName: map['first_name'] ?? 'Nome não encontrado',
      lastName: map['last_name'] ?? ' ',
      avatar: map['avatar'] ?? 'Sem imagem',
    );
  }
}
