# -*- coding: utf-8 -*-
require 'spec_helper'
require 'ninja/hash'

describe Ninja::Hash do
  subject{ Ninja::Hash.new(a:1, "z" => 100) }

  context "指定したキーが存在する場合" do 
    it "プロパティのようにキーを指定できる" do
      expect(subject.a).to eq(1)
      expect(subject.z).to eq(100)
    end
  end

  context "エントリーを追加した場合" do
    it "プロパティのようにアクセスできる" do
      subject[:b] = 100
      expect(subject.b).to eq(100)
    end

    it "hashと同じように振る舞う" do
      subject[:foo] = 200
      subject[:bar] = 300
      expect(subject.keys).to eq([:a, "z", :foo, :bar])
    end
  end

  context "指定したキーが存在しない場合" do
    it { expect(subject.c).to be_nil }
  end

  it "別インスタンスには影響しない" do
    expect(Ninja::Hash.new(hoge: 1).method_defined?(:a)).to be_false
  end
end

describe Hash do
  it :ninja do
    expect({hoge: 1}.ninja.hoge).to eq(1)
  end
end
