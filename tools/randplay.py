import random
import sys

seed, frames, out = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]
r = random.Random(seed)
ev = [(0, 0)]
t = 2600 + r.randrange(0, 600)
for _ in range(8):
    ev += [(t, 0x1000), (t + 6, 0)]
    t += r.randrange(90, 260)
    if r.random() < 0.5:
        ev += [(t, r.choice([0x0100, 0x0200, 0x0800, 0x0400])), (t + 8, 0)]
        t += 40
while t < frames:
    m = 0
    m |= r.choice([0, 0, 0x0100, 0x0200, 0x0800, 0x0400, 0x0900, 0x0a00, 0x0500, 0x0600])
    if r.random() < 0.6: m |= 0x8000
    if r.random() < 0.05: m |= 0x0080
    if r.random() < 0.1: m |= r.choice([0x0020, 0x0010])
    if r.random() < 0.1: m |= 0x4000
    if r.random() < 0.03: m |= 0x0040
    ev.append((t, m))
    t += r.randrange(6, 60)
    if r.random() < 0.02:
        ev += [(t, 0x1000), (t + 6, 0)]
        t += 30
with open(out, 'w') as f:
    for fr, m in ev:
        f.write(f'{fr} {m:x}\n')
