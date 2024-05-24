from io import BytesIO

import requests
from PIL import Image

api_url = 'http://175.178.153.77:10012/'
payload = {
    'model': 'u2netp',  # 使用的模型，默认：u2net，可选值: u2net, u2netp, u2net_human_seg, u2net_cloth_seg
    'a': True,  # Enable Alpha Matting，Default value : false
    'af': 245,  # Alpha Matting (Foreground Threshold)，Default value : 240
    'ab': 5,  # Alpha Matting (Background Threshold)，Default value : 10
    'ae': 100,  # Alpha Matting (Erode Structure Size)，Default value : 10
    'om': False,  # Only Mask，Default value : false
}
files = {'file': open('source.jpg', 'rb')}

res = requests.post(api_url, files=files, params=payload)

source1 = Image.open(BytesIO(res.content)).convert('RGBA')

# source2 = Image.new('RGBA', source1.size, (182, 38, 38))  # 红色
# source2 = Image.new('RGBA', source1.size, (67, 142, 219))  # 蓝色
source2 = Image.new('RGBA', source1.size, (255, 255, 255))  # 白色

img = Image.new("RGBA", source1.size)
img = Image.alpha_composite(img, source2)
img = Image.alpha_composite(img, source1)

img = img.convert('RGB')
# img.show()
img.save('response.png')
