# frozen_string_literal: true

module Member
  attr_accessor :name, :age

  def set_details(name, age)
    @name = name,
    @age = age
  end
end

class Patient
  include Member
  @@consented = 0
  @@not_consented = 0
  attr_accessor :email, :contact, :gender, :consent

  def self.consented_patients
    @@consented
  end

  def self.unconsented_patients
    @@not_consented
  end

  def self.consent_percentage
    (@@consented * 100/ (@@consented + @@not_consented)). to_f
  end

  def initialize(name, age, email, contact, gender, consent)
    set_details(name, age)
    @email = email
    @contact = contact
    @gender = gender
    @consent = consent
    if consent == 'consented'
      @@consented += 1
    else
      @@not_consented += 1
    end
  end

  def eligible_for_trial?
    (gender == 'male' && age >= 12) || (gender == 'female' && age >= 15)
  end
end

class Clinician
  include Member
  attr_accessor :speciality, :region, :status

  def initialize(name, age, speciality, region)
    set_details(name, age)
    @speciality = speciality
    @region = region
    set_status
  end

  def set_status
    @status = (region.downcase == 'india' && speciality.downcase != 'dentist')? 'Active' : 'Inactive'
  end
end
patient_array = []
patient_array.push(
  Patient.new('qwerty', 32, 'ma@m.com', 6_467_865, 'male', 'consented'),
  Patient.new('abcd', 42, 'ma@m.com', 68_477, 'female', 'consented'),
  Patient.new('efgh', 12, 'ma@m.com', 12_345, 'female', 'not_consented'),
  Patient.new('ijajka', 15, 'ama@m.comm', 123_344, 'female', 'consented'),
  Patient.new('svbnd', 13, 'ma@m.com', 11_111, 'female', 'consented'),
  Patient.new('advnv', 22, 'ma@m.com', 222_224, 'male', 'not_consented'),
  Patient.new('shf', 22, 'a@b.com', 222_224, 'female', 'consented')
)
p "consented_patients = #{Patient.consented_patients}"
p "unconsented_patients = #{Patient.unconsented_patients}"
p Patient.consent_percentage
c1 = Clinician.new('abc', 23, 'dentistgggg', 'India')
p c1.status
