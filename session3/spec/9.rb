RSpec.describe 'shared' do
  example "returns [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,nil] , 4=>[nil,true] } , [1,2] ] when given [1,2,3] , [1,2,4]" do
    expect(shared [1,2,3], [1,2,4])
      .to eq [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,nil] , 4=>[nil,true] } , [1,2] ]
  end

  example "returns [ { 'a'=>[true,nil] , 'b'=>[true,true] , 'c'=>[true,nil] , 'd'=>[true,true] , 'aa'=>[nil,true] , 'cc'=>[nil,true] } , ['b','d'] ] when given %w(a b c d) , %w(aa b cc d)" do
    expect(shared %w(a b c d) , %w(aa b cc d))
      .to eq [ { 'a'=>[true,nil] , 'b'=>[true,true] , 'c'=>[true,nil] , 'd'=>[true,true] , 'aa'=>[nil,true] , 'cc'=>[nil,true] } , ['b','d'] ]
  end

  example "returns [ { 1=>[nil,true] , 2=>[nil,true] } , [] ] when given [] , [1,2]" do
    expect(shared [], [1,2])
      .to eq [ { 1=>[nil,true] , 2=>[nil,true] } , [] ]
  end

  example "returns [ { 1=>[true,nil] , 2=>[true,nil] } , [] ] when given [1,2] , []" do
    expect(shared [1,2], [])
      .to eq [ { 1=>[true,nil] , 2=>[true,nil] } , [] ]
  end

  example "returns [ {} , [] ] when given [] , []" do
    expect(shared [], []).to eq [{}, []]
  end

  example "returns [ { 1=>[true,nil] , 2=>[true,nil] , 'a'=>[nil,true] , 'b'=>[nil,true] , :c=>[true,true] } , [:c] ] when given [1,2,:c] , ['a','b',:c]" do
    expect(shared [1,2,:c], ['a','b',:c]).to eq [ { 1=>[true,nil] , 2=>[true,nil] , 'a'=>[nil,true] , 'b'=>[nil,true] , :c=>[true,true] } , [:c] ]
  end

  example "returns [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,true] } , [1,2,3] ] when given [1,2,3] , [3,2,1]" do
    expect(shared [1,2,3], [3,2,1]).to eq [ { 1=>[true,true] , 2=>[true,true] , 3=>[true,true] } , [1,2,3] ]
  end

  it 'handles arrays of different lengths' do
    expect(shared Array(1..10), Array(9..15))
      .to eq [
        {
          1   =>  [true, nil ],
          2   =>  [true, nil ],
          3   =>  [true, nil ],
          4   =>  [true, nil ],
          5   =>  [true, nil ],
          6   =>  [true, nil ],
          7   =>  [true, nil ],
          8   =>  [true, nil ],
          9   =>  [true, true],
          10  =>  [true, true],
          11  =>  [nil,  true],
          12  =>  [nil,  true],
          13  =>  [nil,  true],
          14  =>  [nil,  true],
          15  =>  [nil,  true],
        }, [9, 10]
      ]
  end
end
