feature "creating tags" do

  scenario "I can add a single tag to a new link" do

    visit "/links/new"
    fill_in "url", with: "http://www.bbc.co.uk"
    fill_in "title", with: "This is BBC"
    fill_in "tags", with: "BBC"

    click_button "Create link"
    link = Link.last
    expect(link.tags.map(&:name)).to include("BBC")

  end
end
