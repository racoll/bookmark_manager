

feature "Viewing links" do


    before(:each) do
    # We can use `.create`, which we used in irb to make a Student, within our test!
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end


    # this is a *temporary* sanity check - to make sure we
    # can load the page :)

  scenario 'I can filter links by tag' do
    visit "/tags/bubbles"


    expect(page.status_code).to eq 200

    within 'ul#links' do
     expect(page).not_to have_content('Makers Academy')
     expect(page).not_to have_content('Code.org')
     expect(page).to have_content('This is Zombocom')
     expect(page).to have_content('Bubble Bobble')
   end
    end
  end
