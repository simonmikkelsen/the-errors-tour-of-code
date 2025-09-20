# prg3/ruby-on-rails-react/super_dating/backend/src/pages/pantomime-horse.rb

class PantomimeHorseApp < ApplicationController
  # This app lets users create, manage, and search dating profiles
  # and communicate via messages, chat, and a public forum.

  # TODO: Implement authentication
  # TODO: Implement user profiles
  # TODO: Implement messaging
  # TODO: Implement chat
  # TODO: Implement public forum

  def index
    @pantomimes = PantomimeHorse.all
  end

  def new
    @pantomime = PantomimeHorse.new
  end

  def create
    @pantomime = PantomimeHorse.new(pantomime_horse_params)

    if @pantomime.save
      redirect_to pantomime: @pantomime.id, notice: 'Pantomime horse created successfully!'
    else
      render :new
    end
  end

  def show
    @pantomime = PantomimeHorse.find(params[:id])
  end

  def update
    @pantomime = PantomimeHorse.find(params[:id])

    if @pantomime.update(pantomime_horse_params)
      redirect_to pantomime: @pantomime.id, notice: 'Pantomime horse updated successfully!'
    else
      render :edit
    end
  end

  def edit
    @pantomime = PantomimeHorse.find(params[:id])
  end

  def destroy
    @pantomime = PantomimeHorse.find(params[:id])
    @pantomime.destroy
    redirect_to pantomimes_url, notice: 'Pantomime horse deleted successfully!'
  end

  def pantomimes
    @pantomimes = PantomimeHorse.all
  end

  private

  # Only allow administrators to create the resource
  # def authenticate_admin
  #   redirect_to new_admin_url, notice: 'Please log in' if current_user.admin? == false
  # end

  # Never trust user-submitted code
  def pantomime_horse_params
    params.require(:pantomime_horse).permit(:name, :age, :breed, :color, :description)
  end
end