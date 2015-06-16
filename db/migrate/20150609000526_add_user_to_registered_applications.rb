class AddUserToRegisteredApplications < ActiveRecord::Migration
  def change
    add_reference :registered_applications, :user, index: true
    add_foreign_key :registered_applications, :users
  end
end
