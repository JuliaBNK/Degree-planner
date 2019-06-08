#!/usr/bin/perl
print("Enter 1 for a list of major classes for transfer degree: \n");
print("Enter 2 for a list of major classes for Associate degree \n");
$reply = <STDIN>;
if ($reply == 1)
  {
  print("Here is the list of major classe that you need to take\n");
  print ("CSCI 0012 Programming Concepts & Methodology I\n");
  print ("CSCI 0013 Programming Concepts & Methodology II\n");
  print ("CSCI 0026 Discrete Structures for Computer Science\n");
  print ("CSCI 0030 Analytical Geometry & Calculus I\n");
  print ("CSCI 0031 Analytical Geometry & Calculus II\n");
  print ("CSCI 0205 Principles of Physics: Mechanics\n");
  print ("CSCI 0210 Principles of Physics: Electricity/Magnetism\n");
  print ("You have to take all these classes from the list above.\n");
}
elsif($reply == 2)
  {
  print ("Here is the list of major classes that you need to take\n");
  print ("CSCI 0012 Programming Concepts & Methodology I\n");
  print ("CSCI 0013 Programming Concepts & Methodology II\n");
  print ("CSCI 0026 Discrete Structures for Computer Science\n");
  print ("CSCI 0039 Intro Computer Architecture/Assembly Lang\n");
  print ("CSCI 0050 Intro to Unix/Linux\n");
  print ("CSCI 0062 Web Programming I\n");
  print ("You have to take all these classes from the list above.\n");
  }
else {
  print ("Invalid choice. Good buy!\n");
  exit;
  }

