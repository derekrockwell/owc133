module Refinery
  module Htcs
    class Volunteer < Refinery::Core::BaseModel
			# Include default devise modules. Others available are:
		  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
		  devise :database_authenticatable, :registerable,
		         :recoverable, :rememberable, :validatable, :authentication_keys => ["email"]

      attr_accessible :volunteer_category_ids, :first_name, :last_name, :phone_number, :email, :address, :city, :state, :zip, :position, :password, :remember_me

      has_and_belongs_to_many :volunteer_categories, :join_table => :refinery_htcs_volunteer_interests

      acts_as_indexed :fields => [:first_name]

      validates_presence_of :first_name, :last_name, :zip
      validates :email, :presence => true, :uniqueness => true

			has_and_belongs_to_many :roles, :join_table => :roles_volunteers
			has_many :plugins, :class_name => "VolunteerPlugin", :order => "position ASC", :dependent => :destroy

		  def plugins=(plugin_names)
		    if persisted? # don't add plugins when the volunteer_id is nil.
		      VolunteerPlugin.delete_all(:volunteer_id => id)
		      plugin_names.each_with_index do |plugin_name, index|
		        plugins.create(:name => plugin_name, :position => index) if plugin_name.is_a?(String)
		      end
		    end
		  end

		  def authorized_plugins
		    plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
		  end

		  def can_delete?(user_to_delete = self)
		    user_to_delete.persisted? &&
		      !user_to_delete.has_role?(:superuser) &&
		      Role[:refinery].volunteers.any? &&
		      id != user_to_delete.id
		  end

		  def can_edit?(user_to_edit = self)
		    user_to_edit.persisted? && (
		      user_to_edit == self ||
		      self.has_role?(:superuser)
		    )
		  end

		  def add_role(title)
		    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
		    roles << Role[title] unless has_role?(title)
		  end

		  def has_role?(title)
		    raise ArgumentException, "Role should be the title of the role not a role object." if title.is_a?(Role)
		    roles.any?{|r| r.title == title.to_s.camelize}
		  end

		  def create_first
		    if valid?
		      # first we need to save user
		      save
		      # add refinery role
		      add_role(:refinery)
		      # add superuser role
		      add_role(:superuser) if Role[:refinery].volunteers.count == 1
		      # add plugins
		      self.plugins = Refinery::Plugins.registered.in_menu.names
		    end

		    # return true/false based on validations
		    valid?
		  end

    end
  end
end
