import Bitwise

defmodule Secrets do

  def secret_add(secret) do
    fn opand -> secret + opand end
  end

  def secret_subtract(secret) do
    fn opand -> opand - secret end
  end

  def secret_multiply(secret) do
    fn opand -> secret * opand end
  end

  def secret_divide(secret) do
    fn opand -> floor(opand / secret) end
  end

  def secret_and(secret) do
    fn opand -> opand &&& secret end
  end

  def secret_xor(secret) do
    fn opand -> bxor(opand, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn opand -> opand |> secret_function1.() |> secret_function2.() end
  end

end
