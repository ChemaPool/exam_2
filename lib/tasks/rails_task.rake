namespace :rails_task do
  desc 'Generate Home'
  task task_generate: :environment do
    user = User.find_or_create_by!(
      email: 'homie@homie.com',
      name: 'prueba',
      last_name: 'prueba',
      mobile_phone: '9911028395',
      work_place: 'HomieMxMerida'
    )
    owner = Owner.find_or_create_by!(user: user, curp: '784123000MXM', registered_in_srpago: true)
    Home.create!(
      owner: owner,
      price: 11.5,
      extra_service: 55.12,
      home_features: { garden: false, furnished: true, gym: false },
      master_home_id: nil,
      location: [-99.2385, 19.3366]
    )
  end
end