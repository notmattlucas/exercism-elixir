defmodule Username do

  def sanitize('') do '' end

  def sanitize([head | tail]) do
    transformed = case head do
      c when c >= ?a and c <= ?z -> [c]
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
       _ -> ''
    end
    transformed ++ sanitize(tail)
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
  end

end
