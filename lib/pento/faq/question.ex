defmodule Pento.FAQ.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :content, :string
    field :upvote, :integer

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:content, :upvote])
    |> validate_required([:content, :upvote])
  end
end
