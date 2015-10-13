describe '/admin endpoint' do
  let(:user) { create(:user) }

  it 'requires admin role to access' do
    login_as(user)

    visit '/admin'

    expect(page.status_code).to eq(403)
  end

  it 'user is an admin' do
    user.add_role('admin')

    login_as(user)
    visit '/admin'

    expect(page.status_code).to eq(200)
    expect(page).to have_content('Dashboard')
  end

  def user
    @user ||= create(:user)
  end
end