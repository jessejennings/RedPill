class AddRegidsteredApplicationToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :registered_application, index: true
    add_foreign_key :events, :registered_applications
  end
end
