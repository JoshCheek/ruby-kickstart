# overriding makedirs so that I can pass a path to make them from
# pass the path in a hash at the end if desired
# ie makedirs 'abc' , 'def' , :path => 'ghi'
def makedirs(*dirs)
  path = dirs.pop[:path].sub(%r[/$],'')   if dirs.last.is_a? Hash
  dirs.map! { |dir| "#{path}/#{dir}" }    if path
  super(dirs)
end


# runs the spec against the challenge
# if the environment variable 'solved' has been set,
# then it runs them against the solved challenge instead
def run_spec(chapter,problem)
  ch = "ch#{chapter}"
  if ENV['solved']
    problem_dir = "#{ch}/solved/#{problem}.rb"
  else
    problem_dir = Dir["#{ch}/challenge/#{problem}*"].first
  end  
  sh "ruby -c #{problem_dir}"                                             # check syntax
  sh "spec -cr #{problem_dir} -r enumerator #{ch}/specs/#{problem}.rb"    # run spec (c for colour, r to require the files)
end


# returns array of chapters
def get_chapters
  Dir['*'].grep(/^ch\d+$/).map { |folder_name| folder_name[/\d+$/] }
end


# returns hash where each key is the chapter to test
# each value is a range indicating the problems available for this chapter
def chapters_with_problems
  get_chapters.inject Hash.new do |chapters_with_sections,chapter|
    challenges = Dir["ch#{chapter}/challenge/*"]
    chapters_with_sections[chapter] = challenges.map { |challenge| challenge[%r([^/]+?$)].to_i }.sort
    chapters_with_sections
  end
end


# create tasks for each challenge
chapters_with_problems.each do |chapter,problems|
  namespace chapter do
    problems.each do |problem|
      desc "Test chapter#{chapter} problem#{problem}"
      task(problem) { run_spec chapter , problem }
    end
    desc "Test all problems for chapter#{chapter}"
    task :all => problems.to_a
  end
end

task :default => get_chapters.map { |chapter| "#{chapter}:all" }



desc 'create chapter skeleton'
task :add_ch do
  ch = "ch#{ENV['ch']||get_chapters.size.next}"
  makedirs 'challenge' , 'examples' , 'notes' , 'solved' , 'specs' , :path => ch
  touch "#{ch}/notes/josh.rb"
end
