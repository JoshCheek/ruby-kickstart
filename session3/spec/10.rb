RSpec.describe 'pathify' do
  def self.pathify_example(input, expected)
    example "pathify(#{input.inspect}) # => #{expected.inspect}" do
      actual = pathify input
      expect(actual.sort).to eq expected.sort
    end
  end

  pathify_example({},
                  [])

  pathify_example({'bin' => ['sh']},
                  ['/bin/sh'])

  pathify_example({'usr' => {'bin' => ['ruby']}},
                  ['/usr/bin/ruby'])

  pathify_example({'usr' => {'bin' => ['ruby', 'perl']}},
                  ['/usr/bin/ruby', '/usr/bin/perl'])

  pathify_example({'usr' => {'bin'     => ['ruby'],
                             'include' => ['zlib.h']}},
                  ['/usr/bin/ruby', '/usr/include/zlib.h'])

  pathify_example({'usr' => {'bin'   => ['ruby']},
                   'opt' => {'local' => {'bin' => ['sqlite3',
                                                   'rsync']}}},
                  ['/usr/bin/ruby', '/opt/local/bin/sqlite3', '/opt/local/bin/rsync'])

  pathify_example({'a'=>{'b'=>{'c'=>{'d'=>['e', 'f']}}}},
                  ['/a/b/c/d/e', '/a/b/c/d/f'])

  pathify_example({
    'a' => {
      'b' => {
        'c' => {'d' => %w(e f g h)},
        'i' => {'j' => %w(k l m n)},
      },
      'o' => %w(p q r s),
      't' => %w(u v w x),
    },
    'y' => ['z'],
  }, %w(
    /a/b/c/d/e   /a/b/i/j/k   /a/o/p   /a/t/u   /y/z
    /a/b/c/d/f   /a/b/i/j/l   /a/o/q   /a/t/v
    /a/b/c/d/g   /a/b/i/j/m   /a/o/r   /a/t/w
    /a/b/c/d/h   /a/b/i/j/n   /a/o/s   /a/t/x
  ))
end
