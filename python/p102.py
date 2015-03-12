import collections

Point = collections.namedtuple('Point', ['x', 'y'])

def sign(p1, p2):
    return -p2.x * (p1.y - p2.y) - (p1.x - p2.x) * -p2.y < 0

with open('../resources/p102_triangles.txt') as f:
    count = 0
    for line in f:
        coordinates = [ int(i) for i in line.strip().split(',') ]
        p1 = Point(coordinates[0], coordinates[1])
        p2 = Point(coordinates[2], coordinates[3])
        p3 = Point(coordinates[4], coordinates[5])

        if sign(p1, p2) == sign(p2, p3) == sign(p3, p1):
            count += 1
    print count

