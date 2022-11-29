defmodule Pento.FAQ do
  @moduledoc """
  The FAQ context.
  """

  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.FAQ.Question

  @doc """
  Returns the list of question.

  ## Examples

      iex> list_question()
      [%Question{}, ...]

  """
  def list_question do
    Question
    |> order_by(asc: :id)
    |> Repo.all
  end

  @doc """
  Gets a single question.

  Raises `Ecto.NoResultsError` if the Question does not exist.

  ## Examples

      iex> get_question!(123)
      %Question{}

      iex> get_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_question!(id), do: Repo.get!(Question, id)

  @doc """
  Creates a question.

  ## Examples

      iex> create_question(%{field: value})
      {:ok, %Question{}}

      iex> create_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_question(attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a question.

  ## Examples

      iex> update_question(question, %{field: new_value})
      {:ok, %Question{}}

      iex> update_question(question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a question.

  ## Examples

      iex> delete_question(question)
      {:ok, %Question{}}

      iex> delete_question(question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking question changes.

  ## Examples

      iex> change_question(question)
      %Ecto.Changeset{data: %Question{}}

  """
  def change_question(%Question{} = question, attrs \\ %{}) do
    Question.changeset(question, attrs)
  end

  def answer_question(%Question{} = question, attrs) do
    question
    |> IO.inspect()
    |> Question.answer_question_changeset(attrs)
    |> Repo.update()
  end

  def answer_question_changeset(%Question{} = question, attrs \\ %{}) do
    Question.answer_question_changeset(question, attrs)
  end

  def upvote_question(%Question{} = question, attrs) do
    question
    |> Question.upvote_changeset(attrs)
    |> Repo.update()
  end

  def downvote_question(%Question{} = question, attrs) do
    question
    |> Question.downvote_changeset(attrs)
    |> Repo.update()
  end
end
