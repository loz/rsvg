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
