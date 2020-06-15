class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.references :member
      t.float       :time
      t.date        :date
      t.timestamps
    end
  end
end
