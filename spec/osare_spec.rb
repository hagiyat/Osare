require 'spec_helper'

describe Osare do
  it 'has a version number' do
    expect(Osare::VERSION).not_to be nil
  end

  context 'osare prepended class' do
    let(:prepended) { Base.new }
    it 'enable decorete' do
      expect(prepended.fuga).to eq 'fuga decorated2'
    end
    it 'enable nested decorete' do
      expect(prepended.hoge).to eq 'decorated1 hoge decorated2'
    end
  end

  context 'subclass is extended prepended class' do
    let(:subclass) { Sub.new }
    it 'enable nested decorete from superclass' do
      expect(subclass.hoge).to eq 'decorated1 hoge decorated2'
    end
    pending 'enable decorate on subclass' do
      expect(subclass.piyo).to eq 'oyip'
    end
  end
end
