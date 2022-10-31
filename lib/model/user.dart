class User {
  final String name;
  final String email;
  final String image;
  User({
    required this.name,
    required this.email,
    required this.image,
  });
}

final allUsers = [
  User(
      name: 'Ali',
      email: 'ali@mail.com',
      image:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80'),
  User(
      name: 'veli',
      email: 'vei@mail.com',
      image:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80'),
  User(
      name: 'mehmet',
      email: 'memo@mail.com',
      image:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=986&q=80'),
];
