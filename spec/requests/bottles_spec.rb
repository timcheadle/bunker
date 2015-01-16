require 'rails_helper'

RSpec.describe "Bottles", :type => :request do
  let!(:user) { create(:user) }
  let!(:bourbon) { create(:bottle, spirit: 'bourbon') }
  let!(:rye)     { create(:bottle, spirit: 'rye', open: true) }
  let!(:scotch)  { create(:bottle, spirit: 'scotch', finished: true) }

  before(:each) do
    as_user(user) { visit bottles_path }
  end

  it 'shows bottle details' do
    expect(page).to have_content(bourbon.name)
  end

  context 'filtering by spirit' do
    it 'should show only bourbon' do
      click_link 'Bourbon'
      expect(page).to have_content(bourbon.name)
      expect(page).not_to have_content(rye.name)
      expect(page).not_to have_content(scotch.name)
    end
  end

  context 'filtering by state' do
    it 'should only show open bottles when selected' do
      click_link 'Open'
      expect(page).not_to have_content(bourbon.name)
      expect(page).to have_content(rye.name)
      expect(page).not_to have_content(scotch.name)
    end

    it 'should only show finished bottles when selected' do
      click_link 'Finished'
      expect(page).not_to have_content(bourbon.name)
      expect(page).not_to have_content(rye.name)
      expect(page).to have_content(scotch.name)
    end
  end
end
