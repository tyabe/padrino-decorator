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
    decorate :user
    def name
      user.full_name.present? ? user.full_name : user.username
    end
  end
  class UsersDecorator < Padrino::Decorator::Base
    decorate :users
    def name_list
      users.map{|u| h.decorate(u).name}
    end
  end

  include Padrino::Decorator::DecorateHelpers

  describe '.decorate' do
    it 'Possible to decorate the single object' do
      user = User.new(username: 'Dorothy', full_name: 'Dorothy Gale')
      assert_equal decorate(user).name, user.full_name
    end
    it 'Possible to decorate the collections' do
      users = []
      users << User.new(username: 'Dorothy')
      users << User.new(username: 'Toto')
      assert_equal decorate(users).name_list, %w[Dorothy Toto]
    end
  end

end
