require 'spec_helper'

RSpec.describe 'Document' do
  subject { Document }

  describe "ready?" do
    async "accepts a block" do
      Document.ready? {
        puts `$.fn.jquery`
      }
    end

    async "accepts a block" do
      Document.ready? { }
    end
  end

  describe "ready" do
    p self.ancestors
    async "resolves when document is ready" do
      Document.ready.then do
        async { Document.ready.resolved?.should be_truthy }
      end
    end
  end

  describe "title" do
    async "gets the document title" do
      Document.title.should be_kind_of(String)
    end
  end

  describe "title=" do
    async "sets the document title" do
      old = Document.title
      Document.title = "foo"
      Document.title.should eq("foo")
      Document.title = old
    end
  end

  describe "head" do
    async "returns the head element as an Element instance" do
      expect(subject.head).to be_kind_of(Element)
      expect(subject.head.tag_name).to eq('head')
    end
  end

  describe "body" do
    async "returns the body element as an Element instance" do
      expect(subject.body).to be_kind_of(Element)
      expect(subject.body.tag_name).to eq('body')
    end
  end
end
