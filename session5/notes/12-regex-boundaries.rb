# To match the beginning of a line, use the caret (outside of the
# brackets) and to match the end, use the dollar sign.
"a b"[/^./]  # => "a"
"a b"[/.$/]  # => "b"


# You can match the boundaries between alphanumeric
# and non-alphanumeric with \b
dijkstra = "Elegance is not a dispensable luxury but a factor that decides between success and failure."
dijkstra.scan(/\bd[a-z]*/) # => ["dispensable", "decides"]

