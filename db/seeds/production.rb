[{role: :admin, email: 'admin@teste.com', name: "admin", password: '123456'}].each do |user_seed|
  puts "Inserindo usuários #{user_seed[:email]}"

  user = User.find_or_initialize_by(email: user_seed[:email])
  user.name = user_seed[:name]
  user.role = user_seed[:role]
  user.email = user_seed[:email]
  user.password = user_seed[:password]
  user.password_confirmation = user_seed[:password]
  user.save
end

FactoryBot.build_list(:user_patient, 5).each do |user|
  puts "Criando paciente #{user.name} - #{user.role}"
  user.save
  puts "Salvo paciente #{user.name} - #{user.role}"
end

tag = FactoryBot.create(:tag)

# Criar relacionamentos das tabelas com o admin
User.where(role: :patient).each do |owner|

  puts "Criando appointment de: #{owner.name}"
  appointment = FactoryBot.create(:appointment, user: owner)
  tag.appointments << appointment
  puts "Salvo appointment de: #{owner.name}"

  puts "Criando exam de: #{owner.name}"
  exam = FactoryBot.create(:exam, user: owner)
  tag.exams << exam
  puts "Salvo exam de: #{owner.name}"

  puts "Criando treatment de: #{owner.name}"
  FactoryBot.create(:treatment, user: owner)
  treatment = FactoryBot.create(:treatment, user: owner)
  tag.treatments << treatment
  puts "Salvo treatment de: #{owner.name}"

  puts "Criando shared de: #{owner.name}; para: #{User.first.name}"
  FactoryBot.create(:shared, user: owner, professional: User.first)
  puts "Salvo shared de: #{owner.name}; para: #{User.first.name}"
end
