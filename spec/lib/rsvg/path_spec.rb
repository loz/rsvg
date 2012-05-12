require 'spec_helper'

describe RSVG::Path do
  it_behaves_like 'svg element', :path

  describe "default" do
    it "has style of 2pt black line, no fill" do
      subject.attributes[:style].should == {
        'stroke-width' => "2pt",
        :stroke => :black,
        :fill => :none
      }
    end
  end

  shared_examples_for 'path action' do |command, char|
    it "adds #{command} commands to path data" do
      subject.public_send(command, 100, 100)
      xml = subject.to_xml
      xml.attributes['d'].should == "#{char}100 100"
    end

    it "adds #{command} relatively with :relative => true" do
      subject.public_send(command, 100, 100, :relative => true)
      xml = subject.to_xml
      lchar = char.downcase
      xml.attributes['d'].should == "#{lchar}100 100"
    end

    context "when previous command was same" do
      it "just adds co-ordinates" do
        subject.public_send(command, 100, 100)
        subject.public_send(command, 150, 150)
        xml = subject.to_xml
        xml.attributes['d'].should == "#{char}100 100 150 150"
      end
    end
  end

  describe :move do
    it_behaves_like 'path action', :move, 'M'
  end

  describe :line do
    it_behaves_like 'path action', :line, 'L'
  end

  describe :cubic do
    it_behaves_like 'path action', :cubic, 'C'
  end

  describe :quadratic do
    it_behaves_like 'path action', :quadratic, 'Q'
  end
end
