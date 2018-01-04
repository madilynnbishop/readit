require "rails_helper"
describe Story do
  let!(:story) {Story.create(name: 'title')}
  subject { story }

  it "it is a new story" do
  end

  it "it has a title" do
    expect(story.name).to eq('title')
  end
  
  describe "voting" do
    it "it creates a single vote" do
      story.votes.new
      expect(story.votes.size).to eq(1)
    end
    it "it does not create two votes" do
      story.votes.new
      expect(story.votes.size).to_not eq(2)
    end
  end
  


  describe "validations" do
    it "requires a link" do
      new_story = Story.new
      new_story.valid?
      expect(new_story.errors[:link]).to include("can't be blank")
    end
  end



end