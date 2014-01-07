require File.expand_path("#{File.dirname(__FILE__)}/helpers/helper")

describe Padrino::Decorator::DecorateHelpers do

  class User
    attr_accessor :username, :full_name
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value) rescue nil
      end
    end
  end

  class UserDecorator < Padrino::Decorator::Base
    def name
      object.full_name.present? ? object.full_name : object.username
    end
  end

  include Padrino::Decorator::DecorateHelpers

  describe '.decorate' do
    let(:dorothy) { User.new(username: 'Dorothy', full_name: 'Dorothy Gale') }
    let(:toto)    { User.new(username: 'Toto') }

    it 'Possible to decorate the single object' do
      assert_equal decorate(dorothy).name, dorothy.full_name
    end
    it 'Possible to decorate the collections' do
      users = []
      users << dorothy
      users << toto
      assert_equal decorate(users).first.name, dorothy.full_name
    end
  end

end
