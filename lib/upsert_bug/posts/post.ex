defmodule UpsertBug.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias UpsertBug.Posts.Post


  schema "posts" do
    field :body, :string
    field :title, :string
    field :votes, :integer

    has_many :comments, Comments.Comment
    belongs_to :user, Users.User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
