# User controller, extend Clearance::UsersController
# to add a name to the user.
class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_to '/'
    else
      render template: 'users/new'
    end
  end

  # UPDATE /users/:id
  def update
    if current_user.update update_params
      redirect_to profile_index_path, notice: 'Team set'
    else
      redirect_to profile_index_path, alert: 'Team not set'
    end
  end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def update_params
    params.require(:user).permit(:team_id)
  end
end
