+++
title = "Magento maintenance mode"
date = 2017-09-20T23:45:00Z
updated = 2017-09-20T23:58:56Z
tags = ["e-commerce", "magento"]
blogimport = true 
[author]
	name = "widyamedia"
	uri = "https://www.blogger.com/profile/01098412638320952520"
+++

To set magento 2 in maintenance mode and to make nice maintenance page.<br /><br />1. make / get maintenance image for our maintenance page, ie: maintenance.png<br /><br />2. put at pub/errors/default/images directory under magento root directory, ie: /var/www/magento/pub/errors/default/images/maintenance.png<br /><br />3. edit and save /var/www/magento/pub/errors/default/503.phtml<br /><br /><blockquote><img height="100%" src="images/maintenance.png" width="100%" /></blockquote><br />4. run bin/magento maintenance:enable from magento root directory<br /><br />that's it, and you can see nicer maintenance mode in magento 2<br /><br />To set magento 1 in maintenance mode and to make nice maintenance page.<br /><br />1. make / get maintenance image for our maintenance page, ie: maintenance.png<br /><br />2. put at errors/default/ directory under magento root directory, ie: /var/www/magento/errors/default/maintenance.png<br /><br />3. edit and save /var/www/magento/errors/default/503.phtml <blockquote><h1>We are currently in Maintenance</h1>                <p>The server is currently under maintenance to give better service</p></blockquote><p>4. create file maintenance.flag at magento root directory</p>
