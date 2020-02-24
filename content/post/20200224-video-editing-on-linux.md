---
title: "Video Editing On Linux"
date: 2020-02-24T08:17:54+07:00
tags: ["linux", "video", "editing", "tips", "youtube"]
author: "Widya"
draft: false
---

## Cut and Combine Video

Avidemux

## Youtube
### Add text / caption / subtitle / Anotasi on video
```
1. Buka Youtube Studio dengan mengklik icon akun Anda di sebelah kanan atas > Youtube Studio
2. Pilih menu Subtitles, lalu klik video yang yang ingin diberi teks
3. Untuk video baru, klik set languages, lalu confirm
4. Klik tombol ADD / Tambahkan subtitel atau CC baru.
```

### Add watermark
```
ffmpeg -i input.mp4 -i watermark.png -filter_complex "overlay=1500:1000" output.mp4
```

Referensi:

* https://www.nesabamedia.com/cara-membuat-subtitle-video-youtube/
* https://readmoremyblog.wordpress.com/2012/03/11/cara-membuat-teks-atau-anotasi-pada-video-youtube/
* https://shkspr.mobi/blog/2016/08/easy-ways-to-add-watermarks-to-images-and-videos-in-linux/
