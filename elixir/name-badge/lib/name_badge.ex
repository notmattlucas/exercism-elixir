defmodule NameBadge do
  def print(id, name, department) do
    fid = if id, do: "[#{id}] - ", else: ""
    fdept = if department, do: String.upcase(department), else: "OWNER"
    "#{fid}#{name} - #{fdept}"
  end
end
