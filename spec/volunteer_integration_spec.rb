require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    fill_in('Title', :with => 'Winter Project')
    click_button('Add New Project')
    expect(page).to have_content('Winter Project')
  end
end

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'Winter Project', :id => nil})
    test_project.save
    visit '/'
    click_link('Winter Project')
    click_link('Edit Project')
    fill_in('title', :with => 'Summer Project')
    click_button('Update Project')
    expect(page).to have_content('Summer Project')
  end
end

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'Winter Project', :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    click_button('Delete Project')
    visit '/'
    expect(page).not_to have_content("Winter Project")
  end
end

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page' do
    test_project = Project.new({:title => 'Winter Project', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Snow Vilay', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    click_link('Snow Vilay')
    fill_in('name', :with => 'Jane')
    click_button('Update Volunteer')
    expect(page).to have_content('Jane')
  end
end
