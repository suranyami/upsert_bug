defmodule UpsertBug.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias UpsertBug.Comments.Comment


  schema "comments" do
    field :comment, :string
    field :votes, :integer

    belongs_to :user, User.User

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:comment])
    |> validate_required([:comment])
  end
end
