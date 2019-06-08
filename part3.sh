#!/bin/bash
# Julia Buniak

sqlite3 GE.db << EOF
DROP TABLE general_education;
CREATE TABLE  general_education (
           classID varchar(10),
           title varchar(30),
           units integer(1),
           transfer varchar(20),
           area varchar(30));
INSERT INTO general_education VALUES
('PSYC 0140','Psychology','3','For Transfer','Natural Sciences'),
('ASTR 0002','Astronomy','3', 'For Transfer','Natural Sciences'),
('BIOL 0002','Botany','3','Not for Transfer', 'Natural Sciences'),
('BIOL 0004','Microbiology ','3', 'For Transfer','Natural Sciences'),
('PHYS 0010','Physics','3', 'For Transfer','Natural Sciences'),
('BUS 0049','Law and Society','3', 'For Transfer','Social and Behavioral Sciences'),
('POLS OOO1','American Government','3', 'For Transfer','Social and Behavioral Sciences'),
('NUTF 0010','Principles of Nutrition','3', 'For Transfer','Social and Behavioral Sciences'),
('ANTH 0014','Global Problems','3', 'For Transfer','Social and Behavioral Sciences'),
('BUS 0143','Social Entrepreneurship','3','Not for Transfer','Social and Behavioral Sciences'),
('AAD 0012','Visual Communication','3','For Transfer','Humanities'),
('ART 0008A','Watercolor Painting I','3','For Transfer','Humanities'),
('GER 0001','Elementary German','3','For Transfer','Humanities'),
('ENGL 0033','Introduction to Shakespeare','3','For Transfer','Humanities'),
('THEA 0013','Introduction to Theatre','3','For Transfer','Humanities'),
('ENGL 0001A','Introduction to Composition','3','For Transfer','Language and Rationality'),
('COMM 0001','Fundamentals of Public Speaking','3','For Transfer','Language and Rationality'),
('CSCI 0010','Introduction to Computing','3','For Transfer','Language and Rationality'),
('ENGL 0001B','Critical Thinking and Writing about Literature','3','For Transfer','Language and Rationality'),
('MATH 0016A','Calculus for Social and Life Sciences','4','For Transfer','Language and Rationality'),
('ENGL 0047A','World Literature','3','For Transfer','Language and Rationality'),
('MATH 0027','Trigonometry','4','For Transfer','Language and Rationality'),
('HED 0002','Health Education','2','For Transfer','Health Education/Physical Education'),
('HSCI 0002','Emergency Medical Technician','2','For Transfer','Health Education/Physical Education'),
('ADMJ 0060','Defensive Tactics for Law Enforcement','2','Not for Transfer','Health Education/Physical Education'),
('KIN 0004','Cross Training','2','For Transfer','Health Education/Physical Education'),
('KIN 0051','Jazz Dance','2','For Transfer','Health Education/Physical Education'),
('ENGL 0047A','World Literature','3','For Transfer','Multicultural Studies'),
('ANTH 0007','Native Peoples of California','3','For Transfer','Multicultural Studies'),
('ANTH 0002','Cultural Anthropology','3','For Transfer','Multicultural Studies'),
('BUS 0055','International Business Practices','3','For Transfer','Multicultural Studies'),
('COMM 0007','Intercultural Communication','3','For Transfer','Multicultural Studies');
EOF

pickN()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 20 6 20 25
SELECT * FROM general_education WHERE area = 'Natural Sciences';
EOF
}

pickS()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 25 6 20 35
SELECT * FROM general_education WHERE area = 'Social and Behavioral Sciences';
EOF
}

pickH()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 30 6 20 25
SELECT * FROM general_education WHERE area = 'Humanities';
EOF
}

pickL()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 40 6 20 30
SELECT * FROM general_education WHERE area = 'Language and Rationality';
EOF
}

pickP()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 40 6 20 40
SELECT * FROM general_education WHERE area = 'Health Education/Physical Education';
EOF
}

pickM()
{
sqlite3 GE.db << EOF
.mode column
.headers on
.width 10 40 6 20 40
SELECT * FROM general_education WHERE area = 'Multicultural Studies';
EOF
}

displayClasses()
        {
        echo "To pick area of science press the following options:"
        echo "Natural Sciences                        ==========> [N]"
        echo "Social and Behavioral Sciences          ==========> [S]"
        echo "Humanities                              ==========> [H]"
        echo "Language and Rationality (Two classes)  ==========> [L]"
        echo "Health Education/Physical Education     ==========> [P]"
        echo "Multicultural Studies                   ==========> [M]"
        echo "To quit                                 ==========> [Q]"
        echo
        read -p "Enter area of science >  " reply
        case $reply in
                N|n) pickN;;
                S|s) pickS;;
                H|h) pickH;;
                L|l) pickL;;
                P|p) pickP;;
                M|m) pickM;;
                Q|q) exit;;
                *) echo "Invalid choice!"; exit;;
        esac
        }
echo
echo "In order to earn a degree in Computer Science, you need to take 20 units from 6 different areas of general education. "
echo
echo "Here they are:"
echo "1. Natural Sciences. You need 3 units"
echo "2. Social and Behavioral Sciences. You need 3 units"
echo "3. Humanities. You need 3 units"
echo "4. Language and Rationality. You need 6 units"
echo "5. Health Education/Physical Education. You need 2 units"
echo "6. Multicultural Studies. You need 3 units"
echo
echo "GOOD NEWS!!! We have a variety of classes to pick from. "
echo
echo "It's time to make your choices: "
echo
totalNumber=0
GEclasses=()
for (( i=1; i<=7; i++ ))
        do
        displayClasses
        echo
        read -p "Pick a class > " class
        read -p "Enter number of units > " number
        echo
        GEclasses+=($class)
        let totalNumber=$(($totalNumber+$number))
        done
echo
echo "You have picked the following classes: ${GEclasses[*]}"
echo
echo "The total number of units is $totalNumber"
echo
echo "Congratulation! Now you know your way to the degree in Computer Science! Go forward and GOOD LUCK IN YOUR STUDING!"
echo

