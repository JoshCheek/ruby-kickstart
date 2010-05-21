def run_spec(chapter,problem)
  # sh "spec ch#{chapter}/specs/#{problem}.rb"
  puts "spec ch#{chapter}/specs/#{problem}.rb"
end


# each key is the chapter to test
# each value is a range indicating the problems available for this chapter
chapters = {
  1 => 1..4  ,
  2 => 1..5 ,
}

chapters.each do |chapter,problems|
  namespace chapter do
    problems.each do |problem|
      desc "Test chapter#{chapter} problem#{problem}"
      task(problem) { run_spec chapter , problem }
    end
    desc "Test all problems for chapter#{chapter}"
    task :all => problems.to_a
  end
end

task :default => chapters.keys.map { |chapter| "#{chapter}:all" }