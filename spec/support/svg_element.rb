class ExampleElement
  def to_xml
    REXML::Element.new 'an_example_child'
  end
end

shared_examples_for 'svg element' do |type|
  describe :to_xml do
    it "is a #{type} element" do
      xml = subject.to_xml
      xml.node_type.should == :element
      xml.name.should == type.to_s
    end

    it "adds attributes to it's node" do
      subject.attributes[:foo] = :bar
      xml = subject.to_xml
      xml.attributes['foo'].should == 'bar'
    end
  end

  describe 'attributes' do
    it "assigns attributes given on initialize" do
      element = described_class.new :one => :a, :two => :b
      element.attributes[:one].should == :a
      element.attributes[:two].should == :b
    end
  end
end

shared_examples_for 'parent element' do
  it "accepts children" do
    child = ExampleElement.new
    subject << child

    subject.children.last.should == child
  end

  describe :to_xml do
    it "adds childrens xml" do
      child = ExampleElement.new
      subject << child

      xml = subject.to_xml
      xml.children.last.name.should == 'an_example_child'
    end
  end
end
