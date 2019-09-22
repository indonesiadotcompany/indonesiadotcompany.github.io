---
title: "Migrasi antar hugo"
#featured_image: "images/willkommen.jpg"
date: 2019-09-02T08:17:02+07:00
draft: false
show_reading_time: true
---

To remove a submodule you need to:

Delete the relevant section from the .gitmodules file.
Stage the .gitmodules changes git add .gitmodules
Delete the relevant section from .git/config.
Run git rm --cached path_to_submodule (no trailing slash).
Run rm -rf .git/modules/path_to_submodule (no trailing slash).
Commit git commit -m "Removed submodule "
Delete the now untracked submodule files rm -rf path_to_submodule

Referensi:

https://indonesiadot.com
https://gist.github.com/myusuf3/7f645819ded92bda6677

