---
title: "Hugo hosting dengan github"
date: 2019-09-24T08:17:48+07:00
show_reading_time: true
tags: ["web", "ssg", "hugo", "github", "git"]
author: "Widya"
draft: false
---

Ini adalah langkah yang saya lakukan untuk penempatan web hugo di github, sebelumnya buat dahulu di github nama repository agar tampil sebagai page / website, contoh:

* Nama user: tpinews
* Nama repositori yang harus dibuat: tpinews.github.io

Lalu kemudian pada lokal komputer dijalankan beberapa perintah berikut:

```
mkdir tpinews
cd tpinews
touch .gitignore
git init
git add .
git commit -m 'komat kamit awal'
git remote add origin https://tpinews.github.io.git
git push origin master

git checkout -b hugo
hugo new site . --force
cp -r /path/kumpulanthemeshugo/travelify themes/
cp -r themes/travelify/exampleSite/* .
cp /path/scripts/push-deploy.sh .
git add .
git commit -m 'komit hugo'
git push origin hugo

git submodule add -b master https://tpinews.github.io.git public
./push-deploy.sh
git branch -d master
```
Pastikan juga config.toml sudah sesuai, seperti nama theme dan lainnya, dan bisa di test di localhost dengan menjalankan `hugo server` dan mengakses http://localhost:1313 di browser untuk melihat hasilnya.

Command di atas hanya dilakukan pertama kali saja, untuk selanjutnya yang dilakukan setelah melakukan perubahan dan ingin mengupdate di github, cukup menjalankan script push-deploy.sh

Disini theme yang digunakan misalnya travelify yang sudah disiapkan, dan juga script untuk push-deploy.sh untuk memudahkan deploy sebagai berikut:
```
#!/bin/sh
# If a command fails then the deploy stops
set -e
printf "\033[0;32mPush to branch hugo...\033[0m\n"
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
 msg="$*"
fi
git commit -m "$msg"
git push origin hugo

printf "\033[0;32mDeploy public hugo to branch master...\033[0m\n"
HUGO_ENV=production hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
cd public
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi
git commit -m "$msg"
git push origin master

printf "\033[0;32mPush to branch hugo...\033[0m\n"
cd ..
git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi
git commit -m "$msg"
git push origin hugo
```

Note:

Untuk lebih mudah tidak perlu memasukan password, bisa di buat dari menu settings account github, lalu pilih menu sebelah kiri bawah bagian Developer settings, lalu Personal access tokens dan generate new token.

Lalu copy token tersebut dan tambahkan pada file .git/config dan .git/modules/public/config ,bagian url nya, sehingga menjadi seperti contoh berikut:
```
   url = https://namauser:tokenhasidaricopygeneratenewtoken@namarepository.github.io.git
```

