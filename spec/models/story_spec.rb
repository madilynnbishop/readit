require "rails_helper"
describe Story do
  let!(:story) {Story.create(name: 'title')}
  subject { list }

  it "it is a new list" do
  end

  it "it has a title" do
    expect(story.name).to eq('title')
  end


  describe "validations" do
    it "requires a link" do
      new_story = Story.new
      new_story.valid?
      expect(new_story.errors[:link]).to include("can't be blank")
    end
  end



end