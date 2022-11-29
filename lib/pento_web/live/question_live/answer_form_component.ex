defmodule PentoWeb.QuestionLive.AnswerFormComponent do
  use PentoWeb, :live_component

  alias Pento.FAQ

  @impl true
  def update(%{question: question} = assigns, socket) do
    changeset = FAQ.answer_question_changeset(question)

    {:ok,
      socket
      |> assign(assigns)
      |> assign(:changeset, changeset)
    }
  end

  @impl true
  def handle_event("validate", %{"question" => question_params}, socket) do
    changeset =
      socket.assigns.question
      |> FAQ.answer_question_changeset(question_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"question" => question_params}, socket) do
    save_answer(socket, socket.assigns.action, question_params)
  end

  defp save_answer(socket, :answer, question_params) do
    case FAQ.answer_question(socket.assigns.question, question_params) do
      {:ok, _question} ->
        {:noreply,
          socket
          |> put_flash(:info, "Question answered with success")
          |> push_redirect(to: socket.assigns.return_to)}

          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, assign(socket, :changeset, changeset)}
    end
  end

end
