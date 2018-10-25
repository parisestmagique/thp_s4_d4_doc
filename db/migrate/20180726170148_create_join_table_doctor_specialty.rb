class CreateJoinTableDoctorSpecialty < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors_specialties, id: false do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :specialty, index: true
    end
  end
end
