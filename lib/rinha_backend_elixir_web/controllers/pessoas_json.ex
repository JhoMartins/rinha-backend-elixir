defmodule RinhaBackendElixirWeb.PessoasJSON do
  def index(%{pessoas: pessoas}), do: for(pessoa <- pessoas, do: data(pessoa))

  def show(%{pessoa: pessoa}), do: data(pessoa)

  defp data(pessoa) do
    %{
      id: pessoa.id,
      apelido: pessoa.apelido,
      nome: pessoa.nome,
      nascimento: pessoa.nascimento,
      stack: format_stack(pessoa.stack)
    }
  end

  defp format_stack(stack) when is_binary(stack), do: String.split(stack)
  defp format_stack(_), do: nil
end
