# We've already solved the problem of extracting the data, no need to do it again
require File.dirname(__FILE__) + '/7'


# In reality, I'd use a templating language like ERB,
# but we haven't talked about those yet.
def trees_to_html(trees)
  # the first part of the html skeleton
  result = '
  <!doctype html>
  <html>
    <head><title>Green Thumb Nursery </title></head>
    <body>
      <h1>Catalog</h1>
      <table>
        <tr>
          <td>Type of tree</td>
          <td>Size of the tree</td>
          <td>Price of the tree</td>
        </tr>
  '

  # for each record, add it to the html
  tree_parser(trees).each do |type, size, price|
    result << "
      <tr>
        <td>#{type}</td>
        <td>#{size}</td>
        <td>#{price}</td>
      </tr>
    "
  end

  # close off the html
  result << '
      </table>
    </body>
  </html>
  '

  result
end
