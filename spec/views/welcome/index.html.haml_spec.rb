require 'rails_helper'

RSpec.describe 'welcome/index.html.haml', type: :view do
  it 'should say hello' do
    render

    expect(rendered).to match(/Hello!/)
  end
end
