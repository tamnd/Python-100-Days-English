## Fun Python

This public-class note shows playful and beginner-friendly ways to explore Python.

### A Better Interactive Shell

The lecture recommends `ipython` because it offers:

- `?` and `??` for help
- `!` for shell commands
- tab completion
- magic commands such as `%timeit`

Install it with:

```bash
pip install ipython
```

### Image Processing with Pillow

The lecture uses Pillow to demonstrate fun image operations such as:

- loading an image
- applying filters
- cropping and pasting
- mirroring
- generating thumbnails

Typical Pillow workflow:

```python
from PIL import Image, ImageFilter
```

The main point is that Python can be used not only for serious backend or data work, but also for small visual and creative experiments that make learning more enjoyable.
