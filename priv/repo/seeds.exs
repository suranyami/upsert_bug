#     mix run priv/repo/seeds.exs

alias UpsertBug.Users.User
alias UpsertBug.Posts.Post
alias UpsertBug.Comments.Comment

users =
  0..20
  |> Enum.map(fn _ ->
    %User{
      email: Faker.Internet.email,
      name: Faker.Name.name
    }
  end)

users
|> Enum.each(fn user ->
  UpsertBug.Repo.insert!(user)
end)
