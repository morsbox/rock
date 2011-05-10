Rock'n'Ror - CMS for easy websites, based on Ruby on Rails
==========================================================

Installing
----------
Rock is under construction, so not install it :)
For testing you can simple 

Functionality
-------------
1. Superadmin user created as seed when 'rake db:seed' with standart paasword.
_Don't forget to change pass!_
2. Admin zone situated in /admin path. Authorization is common both for admin
zone and for frontend.
3. Used standart Rails layout concepte. Default is layouts/application
4. Static pages have url_match field. So if no matching resources found - system
seek for matching static page
5. Siders is registered view helper, they are is placed on webpage on the sides
of content. Siders have some position, which must be marked in layout as
'sider :sidername'. Sider helpers must be placed in helpers/siders. Sider helper
file must contain some mandatory information - see for example [static_siders_helper.rb](https://github.com/Mik-die/rock/blob/master/app/helpers/siders/static_siders_helper.rb)
6. Menu - no completed now.



TODO list
---------------
1. User system with some access levels. Every action or shown page must have
minimal access level. Default - for frontend page 0 (it equal guest level), for
backend (admin) zone - 50. Superadmin have level 100. Blocked user have negative
access level, matching their previous level (blocked superadmin will have level
-100)

2. Static content system with access by matching url. This system must be
applied when no matching resources found.

3. Controllers, generating some frontend content must be registered as
ContentPage. It's necessary for common processing of 'siders' and assigning
access levels

4. Sider - registered view helper - is placed on webpage on the sides of
content.

5. Menu is complex thing. On the one hand - it is kind of sider, on th other -
it is link between content pages, users and other siders. It is base navigating
system of cms.

6. Admin zone for managing of all of them.
