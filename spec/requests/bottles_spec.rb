require 'rails_helper'

RSpec.describe "Bottles", :type => :request do
  let!(:user) { create(:user) }
  let!(:bourbon) { create(:bottle, spirit: 'bourbon') }
  let!(:rye)     { create(:bottle, spirit: 'rye') }

  before(:each) do
    as_user(user) { visit bottles_path }
  end

  it 'shows bottle details' do
    expect(page).to have_content(bourbon.name)
  end

  context 'filtering by spirit' do
    it 'should show only bourbon' do
      click_link 'Bourbon'
      save_and_open_page
      expect(page).to have_content(bourbon.name)
      expect(page).not_to have_content(rye.name)
    end
  end
end
