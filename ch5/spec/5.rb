require 'pathname'
file = Pathname.new(__FILE__).parent.parent.parent + 'ch4' + 'spec' + '6'
require file.to_s