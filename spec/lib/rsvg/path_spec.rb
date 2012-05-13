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

    it "starts with move to 0 0" do
      subject.to_xml.attributes['d'].should == 'M0 0'
    end
  end

  shared_examples_for 'path action' do |command, char, condenses = false|
    it "adds #{command} commands to path data" do
      subject.public_send(command, 100, 100)
      xml = subject.to_xml
      xml.attributes['d'].should end_with "#{char}100 100"
    end

    it "adds #{command} relatively with :relative => true" do
      subject.public_send(command, 100, 100, :relative => true)
      xml = subject.to_xml
      lchar = char.downcase
      xml.attributes['d'].should end_with "#{lchar}100 100"
    end

    it "adds each #{command} co-ordinates" do
      subject.public_send(command, 100, 100)
      subject.public_send(command, 150, 150)
      xml = subject.to_xml
      if condenses
        xml.attributes['d'].should end_with "#{char}100 100 150 150"
      else
        xml.attributes['d'].should end_with "#{char}100 100 #{char}150 150"
      end
    end
  end

  context "when initialized with co-ordinates" do
    subject { described_class.new 10, 10 }

    it "moves to given co-ordinates" do
      subject.to_xml.attributes['d'].should == 'M10 10'
    end
  end

  describe :move do
    before :each do
      subject.line 0, 0 #To ensure isn't preceded by a move command
    end
    it_behaves_like 'path action', :move, 'M'
  end

  describe :line do
    it_behaves_like 'path action', :line, 'L'
  end

  describe :cubic do
    it_behaves_like 'path action', :cubic, 'C', true
  end

  describe :quadratic do
    it_behaves_like 'path action', :quadratic, 'Q', true
  end

  describe :arc do
    it "has xy radius and end points, with 0 defaults for other flags" do
      subject.arc 20, 10, 50, 75
      subject.to_xml.attributes['d'].should end_with 'A20 10 0 0 0 50 75'
    end

    it "has flag :large" do
      subject.arc 20, 10, 50, 75, :large => true
      subject.to_xml.attributes['d'].should end_with 'A20 10 0 1 0 50 75'
    end

    it "has flag :invert for sweep" do
      subject.arc 20, 10, 50, 75, :invert => true
      subject.to_xml.attributes['d'].should end_with 'A20 10 0 0 1 50 75'
    end

    it "has :rotation option" do
      subject.arc 20, 10, 50, 75, :rotation => 45
      subject.to_xml.attributes['d'].should end_with 'A20 10 45 0 0 50 75'
    end
  end
end
