class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :previous_ip 
      t.timestamps
    end
  end
end
