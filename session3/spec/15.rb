RSpec.describe 'middle' do
  it 'is a toplevel method' do
    method :middle # will raise an error if it can't find the method
  end

  list = nil

  1.upto 10 do |i|
    head      = {:data => i, :next => list}
    list      = head
    expected  = (i/2.0).ceil
    it "finds #{expected} for #{head.inspect}" do
      expect(middle head).to eq expected
    end
  end
end
