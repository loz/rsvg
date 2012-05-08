shared_examples_for 'svg element' do |type|

  it "should be a #{type} element" do
    xml = subject.to_xml
    xml.node_type.should == :element
    xml.name.should == type.to_s
  end

end
