import sys
from PIL import Image
ims = [Image.open(p).convert('RGB') for p in sys.argv[2:]]
cols = min(4, len(ims)); rows = (len(ims) + cols - 1) // cols
W, H = 256, 224
m = Image.new('RGB', (cols * W, rows * H), (40, 0, 40))
for i, im in enumerate(ims):
    m.paste(im, ((i % cols) * W, (i // cols) * H))
m.save(sys.argv[1])
