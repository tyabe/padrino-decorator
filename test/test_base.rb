require File.expand_path("#{File.dirname(__FILE__)}/helpers/helper")

describe Padrino::Decorator::Base do
  let(:decorator_class) { Class.new(Padrino::Decorator::Base) }
  let(:model)           { Object.new }

  describe "#initialize" do
    subject { decorator_class.new(model) }

    it 'Reports its type as if it was the original object' do
      subject.class.must_equal model.class
      subject.must_be_kind_of  model.class
      assert subject.kind_of?(model.class),     "The subject class (#{subject.class}) is not kind_of? the model class (#{model.class})."
      assert subject.is_a?(model.class),        "The subject class (#{subject.class}) is not is_a? the model class (#{model.class})."
      assert subject.instance_of?(model.class), "The subject class (#{subject.class}) is not an instance_of? the model class (#{model.class})."
    end
  end

end
