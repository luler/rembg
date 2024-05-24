FROM python:3.9

MAINTAINER 1207032539@qq.com

WORKDIR /root

RUN pip install --no-cache-dir rembg -i https://mirrors.aliyun.com/pypi/simple/

RUN mkdir /root/.u2net && cd /root/.u2net \
    && wget -O u2net.onnx "http://luler.top:5244/d/%E8%BD%AF%E4%BB%B6%E6%96%87%E4%BB%B6/%E9%A2%84%E6%A3%80%E6%B5%8B%E6%A8%A1%E5%9E%8B/rembg/u2net.onnx" \
    && wget -O u2netp.onnx "http://luler.top:5244/d/%E8%BD%AF%E4%BB%B6%E6%96%87%E4%BB%B6/%E9%A2%84%E6%A3%80%E6%B5%8B%E6%A8%A1%E5%9E%8B/rembg/u2netp.onnx" \
    && wget -O u2net_human_seg.onnx "http://luler.top:5244/d/%E8%BD%AF%E4%BB%B6%E6%96%87%E4%BB%B6/%E9%A2%84%E6%A3%80%E6%B5%8B%E6%A8%A1%E5%9E%8B/rembg/u2net_human_seg.onnx" \
    && wget -O u2net_cloth_seg.onnx "http://luler.top:5244/d/%E8%BD%AF%E4%BB%B6%E6%96%87%E4%BB%B6/%E9%A2%84%E6%A3%80%E6%B5%8B%E6%A8%A1%E5%9E%8B/rembg/u2net_cloth_seg.onnx"

EXPOSE 5000

CMD [ "rembg", "s" ]