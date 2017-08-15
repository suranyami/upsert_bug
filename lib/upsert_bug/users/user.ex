defmodule UpsertBug.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias UpsertBug.Users.User

  schema "users" do
    field :email, :string
    field :name, :string

    has_many :posts, Posts.Post
    has_many :comments, Comments.Comment

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
  end
end
