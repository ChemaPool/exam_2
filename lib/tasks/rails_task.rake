namespace :rails_task do
  desc 'Generate Home'
  task task_generate: :environment do
    user = User.find_or_create_by!(
      email: 'Hola@holi.com',
      name: 'Hola',
      last_name: 'Holi',
      mobile_phone: '9911028356',
      work_place: 'HomieMxMeridaHoli'
    )
    owner = Owner.find_or_create_by!(user: user, curp: 'Holi784123000MXM', registered_in_srpago: true)
    Home.create!(
      owner: owner,
      price: 20.5,
      extra_service: 55.12,
      home_features: { garden: false, furnished: true, gym: false },
      master_home_id: nil,
      location: [-99.2385, 20.3366]
    )
  end
end