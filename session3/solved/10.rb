def pathify(paths=Hash.new)
  # base step
  return paths.map { |path| '/' + path } if paths.is_a? Array

  # recursive step
  to_return = []
  paths.each do |parent_path, child_dirs|
    parent_path = '/' + parent_path         # paths begin with a /
    child_paths = pathify child_dirs        # convert child directories to paths
    child_paths.each do |child_path|        # join each child path to it's parent path
      to_return << (parent_path + child_path)
    end
  end
  to_return
end
