defmodule Pento.FAQ.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "question" do
    field :content, :string
    field :upvote, :integer
    field :answer, :string

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:content, :upvote, :answer])
    |> validate_required([:content, :upvote, :answer])
  end

  def upvote_changeset(question, attrs) do
    question
    |> cast(attrs, [:upvote])
    |> validate_number(:upvote, greater_than: question.upvote)
  end

  def downvote_changeset(question, attrs) do
    question
    |> cast(attrs, [:upvote])
    |> validate_number(:upvote, less_than: question.upvote)
  end

  def answer_question_changeset(question, attrs) do
    question
    |> cast(attrs, [:answer])
    |> validate_required([:answer])
  end
end
