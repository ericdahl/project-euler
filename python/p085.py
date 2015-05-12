def count_rect(width, height):
    count = 0
    for x in xrange(width):
        for y in xrange(height):
            count += (width - x) * (height - y)
    return count


best_delta = 100000000
best_width = 0
best_height = 0

for w in xrange(1, 100):
    for h in xrange(w, 100):
        rects = count_rect(w, h)
        delta = abs(2000000 - rects)
        if rects > 2000000 + best_delta:
            # stop if we've gone past the best result
            break
        if delta < best_delta:
            best_delta = delta
            best_width = w
            best_height = h

print best_width * best_height
