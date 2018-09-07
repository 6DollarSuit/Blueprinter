'Programmer: Emily Frost Wood
'Date: 9/4/2018
'Goal: Generate Floorplans
OPTION BASE 1
SCREEN 12
RANDOMIZE TIMER
OPTION BASE 1
'I need to store 4 coordinate sets,
'for use later in constructing interior walls
'without going out of bounds
'... ... ...
'To do this, I'll make a 2-dimensional array!
'NO I WON'T JESUS CHRIST THOSE ARE TOO HARD
'I'm just using 2 matching arrays instead.
DIM Row(4) AS INTEGER
DIM Column(4) AS INTEGER
temp% = 0
'With each pass,
'a new set of random coordinates are created.
WHOOPS:
FOR counter = 1 TO 4
    temp = INT(RND * 300) + 100
    Row(counter) = temp
    temp = INT(RND * 300) + 100
    Column(counter) = temp
NEXT
IF Column(1) = Column(3) THEN GOTO WHOOPS:
IF Row(1) = Row(3) THEN GOTO WHOOPS:
'tbh i think i wont use the (2) or (4) coords at all lmao
LINE (Column(1), Row(1))-(Column(3), Row(3)), , B
'data
PRINT "Length:"
Length% = ABS(Column(1) - Column(3))
PRINT Length%
PRINT "Width:"
Width% = ABS(Row(1) - Row(3))
PRINT Width%
PRINT "Ratio:"
Ratio! = ((Column(1) - Column(3))) / (ABS(Row(1) - Row(3)))
PRINT Ratio!
'find centers of walls for making interior walls connect
'Find center of house
CenterC% = INT((ABS(Column(1) + (Column(3)))) / 2)
CenterR% = INT(ABS(((Row(1) + Row(3)))) / 2)
'use center
LINE (CenterC%, Row(1))-(CenterC%, Row(3))
LINE (Column(1), CenterR%)-(Column(3), CenterR%)
'doors!
IF Length% < Width% THEN Door% = INT(Length% / 6)
IF Width% < Length% THEN Door% = INT(Width% / 6)

DoorL% = INT(Length% / 6)
DoorW% = INT(Width% / 6)

'CIRCLE (CenterC%, CenterR%), Door%
'3 of these 4 must happen, 1 must not.
'This will ensure the house is walkable
'and will give it a C-shape.
Layout% = INT(RND * 4) + 1
IF Layout% <> 1 THEN CIRCLE (CenterC%, CenterR% + (Door% * 2)), Door%
IF Layout% <> 2 THEN CIRCLE (CenterC%, CenterR% - (Door% * 2)), Door%
IF Layout% <> 3 THEN CIRCLE (CenterC% + (Door% * 2), CenterR%), Door%
IF Layout% <> 4 THEN CIRCLE (CenterC% - (Door% * 2), CenterR%), Door%








SLEEP
