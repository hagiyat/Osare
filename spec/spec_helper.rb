$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'osare'

class Base
  prepend Osare
  osare :decorator1, :hoge
  osare :decorator2, %i(hoge fuga)

  def decorator1
    'decorated1 ' + yield
  end

  def decorator2
    yield + ' decorated2'
  end

  def hoge
    'hoge'
  end

  def fuga
    'fuga'
  end
end

class Sub < Base
  prepend Osare
  osare :decorator3, :piyo

  def decorator3
    p yield
    # yield.reverse
  end

  def piyo
    'piyo'
  end
end
