class Person:
    def __init__(self, person_name, dob, ht):
        self.name = person_name
        self.dob = dob
        self.height = ht

    def get_name(self):
        return self.name

    def set_name(self, new_name):
        if self.__has_any_number(new_name):
            print("Why input number")
            return
        self.name = new_name

    def __has_any_number(self, string):
        return "0" in string

    def get_summary(self):
        return f"Name: {self.name}, DOB: {self.dob}, Height: {self.height}"

a_person = Person("Nayeem", "1909", "6 Feet")
print(a_person.get_summary())
a_person.set_name("998787nayeem")
a_person.name = "sNahd"
print(a_person.set_name)