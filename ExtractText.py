import base64
from io import BytesIO

from PIL import Image
from pytesseract import pytesseract


class ExtractText:

    def extract(self, base64Text):
        image = base64.b64decode(base64Text)
        raw = BytesIO(image)
        im = Image.open(raw).convert('LA')
        custom_config = r' -l tur+eng --oem 3 --psm 6'
        result = pytesseract.image_to_string(im, config=custom_config)
        print(result)
        return result
