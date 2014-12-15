require 'fileutils'

RSpec.describe 'line_sums' do
  expected_answers = {
    '8.1' => 4399,
    '8.2' => 0,
    '8.3' => 4399,
    '8.4' => 12,
    '8.5' => 3,
    '8.6' => 5,
    '8.7' => 23793343701,
    '8.8' => 880754605216,
    '8.9' => 2987648672,
  }

  template_pattern = File.expand_path "../../resources/*.template", __FILE__
  Dir[template_pattern].each do |template_path|
    real_path       = template_path.sub /\.template$/, ''
    expected_answer = expected_answers.fetch real_path[/(\d+\.\d+$)/]

    example "#{real_path} sums to #{expected_answer}" do
      begin
        FileUtils.cp template_path, real_path
        expect(line_sums real_path).to eq expected_answer
      ensure
        FileUtils.rm real_path
      end
    end

  end
end
