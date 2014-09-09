# -*- coding: utf-8 -*-
require 'spec_helper'
require 'ninja/hash'

describe Ninja::Hash do
  subject{ Ninja::Hash.new(a:1, "z" => 100, h: {a: 1, b: 2}) }

  context "指定したキーが存在する場合" do 
    it "プロパティのようにキーを指定できる" do
      expect(subject.a).to eq(1)
      expect(subject.z).to eq(100)
    end
  end

  context "指定したキーが存在しない場合" do
    it { expect(subject.c).to be_nil }

    it "プロパティのように代入できる" do
      hash = subject
      value = 100
      hash.c = value
      expect(hash.c).to eq(value)
      expect(hash["c"]).to eq(value)
      expect(hash[:c]).to be_nil
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
      expect(subject.keys).to eq([:a, "z", :h, :foo, :bar])
    end
  end

  context "valueがHashの場合" do
    it "valueもninja" do
      expect(subject.h.a).to eq(1)
    end

    context "valueを破壊的に変更した場合" do
      it "元のオブジェクトも変更される" do
        hash = subject
        x = hash.h
        x[:test] = 1000
        expect(hash.h.test).to eq(1000)
      end
    end
  end

  it "別インスタンスには影響しない" do
    expect(Ninja::Hash.new(hoge: 1).respond_to?(:a)).to be_false
  end

  describe "#get" do
    context "キーが存在する場合" do
      it { expect(subject.get(:a)).to eq(1) }
      it { expect(subject.get('a')).to eq(1) }
    end

    context "キーが存在しない場合" do
      it { expect(subject.get(:hoge)).to be_nil }

      context "ブロックを渡した場合" do
        it "ブロックの実行結果が返る" do
          expect(subject.get(:hoge){ 1 + 1 }).to eq(2)
          expect(subject.get("hoge"){ 1 + 1 }).to eq(2)
        end
      end
    end
  end
end

describe Hash do
  it :ninja do
    expect({hoge: 1}.ninja.hoge).to eq(1)
  end
end
