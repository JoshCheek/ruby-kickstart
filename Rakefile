def run_spec(chapter,problem)
  root_dir     = "ch#{chapter}"
  problem_dir  =  ENV['solved'] && "#{root_dir}/solved/#{problem}.rb" || Dir["#{root_dir}/challenge/#{problem}*"].first
  
  sh "spec -cr #{problem_dir} #{root_dir}/specs/#{problem}.rb"
end


# each key is the chapter to test
# each value is a range indicating the problems available for this chapter
chapters = {
  1 => 1..9
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