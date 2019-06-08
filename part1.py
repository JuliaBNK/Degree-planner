#!/usr/bin/python
Allclasses = []
totalUnits = 0
count = 0

print("Enter the name of the class exactly as it appears in the college schedule.")
classes = raw_input("Enter one class at a time. Press Done after the last one > ")
while((not classes ==  "Done") and (not classes ==  "done")):
    Allclasses.append(classes)
    unit = int(input("Enter the number of units for this class > "))
    totalUnits += unit
    classes = raw_input("Enter the next class > ")
    count +=1
print("Got it!")
print "This is a good start! You have already taken ", count, "class(es)."
print("These classes are: ")
for i in Allclasses:
     print(i)
rest=60-totalUnits
print "You have already got ", totalUnits," units from 60 units. You still need to take ", rest, " units."


