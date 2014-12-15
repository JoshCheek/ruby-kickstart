gem 'rspec', '~> 3.0'

# overriding Rake method that displays tasks so that -T will display in the correct order
module Rake
  class Application
    def display_tasks_and_comments
      displayable_tasks = tasks.select { |t| t.comment && t.name =~ options.show_task_pattern }.sort do
        |t1,t2|
        one_is_session = t1.name[/^\d+:(\d+|all)$/]
        two_is_session = t2.name[/^\d+:(\d+|all)$/]
        if one_is_session && two_is_session
          session1 , prb1 = t1.name.split ':'
          session2 , prb2 = t2.name.split ':'
          if session1 == session2
            if prb1 == 'all' then 1 elsif prb2 == 'all' then -1 else prb1.to_i <=> prb2.to_i end
          else
            session1.to_i <=> session2.to_i
          end
        elsif one_is_session
          -1
        elsif two_is_session
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
def run_spec(session_num,problem)
  sess = "#{File.dirname(__FILE__)}/session#{session_num}"
  if ENV['solved']
    problem_dir = "#{sess}/solved/#{problem}.rb"
  else
    problem_dir = Dir["#{sess}/challenge/#{problem}_*.rb"].first
  end
  sh "ruby -c '#{problem_dir}'"                                                             # check syntax
  sh "rspec -cr '#{problem_dir}' -r enumerator '#{sess}/spec/#{problem}.rb' --fail-fast"    # run spec (c for colour, r to require the files, enumerator required for 1.8.6 compatibility)
end


# returns array of sessions
def get_sessions
  Dir['*'].grep(/^session\d+$/).map { |folder_name| folder_name[/\d+$/] }
end


# returns hash where each key is the session to test
# each value is a range indicating the problems available for this session
def sessions_with_problems
  get_sessions.inject Hash.new do |sessions_with_sections, session|
    challenges = Dir["session#{session}/challenge/*.rb"]
    sessions_with_sections[session] = challenges.map { |challenge| challenge[%r([^/]+?$)].to_i }.sort
    sessions_with_sections
  end
end


# create tasks for each challenge
sessions_with_problems.each do |session, problems|
  namespace session do
    problems.each do |problem|
      desc "Test session#{session} problem#{problem}"
      task(problem) { run_spec session , problem }
    end
    desc "Test session#{session} all problems"
    task :all => problems.to_a
  end
end

task :default => get_sessions.map { |session| "#{session}:all" }

