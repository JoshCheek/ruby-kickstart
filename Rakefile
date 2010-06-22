# overriding Rake method that displays tasks so that -T will display in the correct order
module Rake
  class Application
    def display_tasks_and_comments
      displayable_tasks = tasks.select { |t| t.comment && t.name =~ options.show_task_pattern }.sort do 
        |t1,t2| 
        one_is_ch = t1.name[/^\d+:(\d+|all)$/]
        two_is_ch = t2.name[/^\d+:(\d+|all)$/]
        if one_is_ch && two_is_ch
          ch1 , prb1 = t1.name.split ':'
          ch2 , prb2 = t2.name.split ':'
          if ch1 == ch2
            if prb1 == 'all' then 1 elsif prb2 == 'all' then -1 else prb1.to_i <=> prb2.to_i end
          else
            ch1.to_i <=> ch2.to_i
          end
        elsif one_is_ch
          -1
        elsif two_is_ch
          1
        else
          t1.name <=> t2.name
        end
      end
      if options.full_description
        displayable_tasks.each do |t|
          puts "rake #{t.name_with_args}"
          t.full_comment.split("\n").each do |line|
            puts "    #{line}"
          end
          puts
        end
      else
        width = displayable_tasks.collect { |t| t.name_with_args.length }.max || 10
        max_column = truncate_output? ? terminal_width - name.size - width - 7 : nil
        displayable_tasks.each do |t|
          printf "#{name} %-#{width}s  # %s\n",
            t.name_with_args, max_column ? truncate(t.comment, max_column) : t.comment
        end
      end
    end
  end
end


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
    problem_dir = Dir["#{ch}/challenge/#{problem}_*"].first
  end  
  sh "ruby -c #{problem_dir}"                                             # check syntax
  sh "spec -cr #{problem_dir} -r enumerator #{ch}/specs/#{problem}.rb"    # run spec (c for colour, r to require the files, enumerator required for 1.8.6 compatibility)
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
    desc "Test chapter#{chapter} all problems"
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
