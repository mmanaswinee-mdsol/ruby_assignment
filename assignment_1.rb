participant_values = ['John Doe', '20', 'Male']
fullname=participant_values[0].split(' ')

participant_values.shift

participant_values.insert(0,fullname.first)
participant_values.insert(1,fullname.last)

participant_keys=[:first_name,:last_name,:age,:gender]
participant_hash = (participant_keys.zip(participant_values)).to_h

puts "Dear Mr/Ms #{participant_hash[:first_name]} #{participant_hash[:last_name]}\nThanks for your participation in this clinical trial. \nBelow are your captured details,\nFirst Name: #{participant_hash[:first_name]}\nLast Name: #{participant_hash[:last_name]}\nAge: #{participant_hash[:age]}\nGender: #{participant_hash[:gender]}"
