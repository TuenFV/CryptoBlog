RailsAdmin.config do |config|
  config.asset_source = :sprockets

  # Remove model Vesting and #Pool from admin_rails
  config.excluded_models << Vesting  #<< Pool

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    unless current_user.try(:admin?)
      redirect_to main_app.root_path
    end
  end
  #config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    show
    #bulk_delete
    #edit
    #delete
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    list do
      field :id
      field :email
      field :sign_in_count
      field :last_sign_in_at
      field :last_sign_in_ip
      field :role
    end
  end

  config.model 'Pool' do
    list do
      field :project
      field :round
      field :platform
      field :amount
      field :price
      field :vesting
      field :user
    end
  end
end
