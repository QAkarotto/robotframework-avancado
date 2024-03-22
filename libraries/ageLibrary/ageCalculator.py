import datetime

def calculate_age_in_years(birthdate):
  day,month,year = map(int, birthdate.split("-"))
  today = datetime.date.today()
  age = today.year - year - ((today.month, today.day) < (month, day))
  print("Your age is",age,"years.")
  return age
  
def calculate_birth_year(age_in_current_year):
  today = datetime.date.today()
  year = today.year - int(age_in_current_year)
  print("Your birth year is",year)
  return year
