require 'fileutils'

#This method cats all .rb files together into one file, I used it to cat the pages of notes 
#for each session together into one file - easier reading.
def cat_by_ext search_name_text, search_dir = Dir.pwd, new_file_name = "cat_by_ext_#{rand(9999)}.txt"
	search_dir.slice!(-1) if search_dir[-1] == '/'
	return 'search directory invalid!' unless File.exists?(search_dir)
	names_array	= Dir["#{search_dir}/**/*#{search_name_text}*"]
	names_array.sort!
	content = ''
	names_array.each do |file_name|
		content = content + "##{file_name} file content is listed below\n"+'#'*79+"\n\n" 
		content = content + File.read(file_name)
		content = content + "\n"+'#'*34 + ' -- END -- ' + '#'*34 + "\n\n\n\n"
	end
	File.write("#{search_dir}/#{new_file_name}",content)
	return nil
end


cat_by_ext('.rb','/Users/joekelly/Desktop/Projects/ruby-kickstart/session6/notes','session6 notes.rb')


