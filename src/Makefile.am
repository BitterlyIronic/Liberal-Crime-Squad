bin_PROGRAMS = crimesquad
crimesquad_SOURCES = game.cpp lcsio.cpp cursesmovie.cpp compat.cpp\
 cursesgraphics.cpp lcsio.h cursesmovie.h compat.h cursesgraphics.h includes.h\
 externs.h common/commondisplay.cpp common/commonactions.cpp\
 common/consolesupport.cpp common/getnames.cpp common/translateid.cpp\
 common/equipment.cpp creature/augmentation.cpp creature/creature.cpp title/titlescreen.cpp\
 title/highscore.cpp title/newgame.cpp title/saveload.cpp basemode/basemode.cpp\
 basemode/baseactions.cpp basemode/activate.cpp basemode/reviewmode.cpp\
 sitemode/advance.cpp sitemode/mapspecials.cpp sitemode/newencounter.cpp\
 sitemode/sitemode.cpp sitemode/talk.cpp sitemode/miscactions.cpp\
 sitemode/sitedisplay.cpp sitemode/stealth.cpp combat/chase.cpp\
 combat/fight.cpp combat/haulkidnap.cpp daily/activities.cpp daily/daily.cpp\
 daily/date.cpp news/news.cpp daily/shopsnstuff.cpp daily/siege.cpp\
 monthly/endgame.cpp monthly/justice.cpp monthly/lcsmonthly.cpp\
 monthly/monthly.cpp politics/politics.cpp daily/interrogation.cpp\
 daily/recruit.cpp politics/law.cpp politics/alignment.h politics/law.h\
 configfile.cpp configfile.h news/ads.cpp news/headline.cpp news/layout.cpp\
 news/majorevent.cpp news/squadstory_text.cpp sitemode/sitemap.h\
 sitemode/sitemap.cpp news/news.h\
 locationdef.h basemode/activate_sleepers.cpp monthly/sleeper_update.cpp\
 items/armor.cpp creature/augmenttype.cpp creature/creaturetypes.cpp basemode/liberalagenda.cpp\
 common/misc.cpp common/help.cpp creature/augmentation.h creature/creature.h\
 creature/creaturenames.cpp cmarkup/Markup.cpp cmarkup/Markup.h vehicle/vehicle.cpp vehicle/vehicle.h\
 vehicle/vehicletype.cpp vehicle/vehicletype.h items/weapontype.h\
 items/armortype.cpp items/armortype.h items/clip.cpp items/clip.h\
 items/cliptype.cpp items/cliptype.h items/item.cpp items/item.h\
 items/itemtype.cpp items/itemtype.h items/loot.cpp items/loot.h\
 items/loottype.cpp items/loottype.h items/money.cpp items/money.h\
 items/weapon.cpp items/weapon.h items/weapontype.cpp items/armor.h\
 sitemode/shop.h sitemode/shop.cpp log/log.h log/log.cpp locations/locations.cpp\
 title/initfile.cpp locations/world.cpp locations/locations.h common.h creature/augmenttype.h\
 creature/creaturetype.h creature/creaturetype.cpp common/stringconversion.cpp

crimesquad_CPPFLAGS = -DINSTALL_DATA_DIR=\"$(datadir)\"
crimesquad_CXXFLAGS = -I$(top_srcdir)/src

if !WITH_NCURSES
SUBDIRS = pdcurses

noinst_LIBRARIES = libpdcurses.a
libpdcurses_a_SOURCES = 

crimesquad_DEPENDENCIES = libpdcurses.a
crimesquad_LDADD = pdcurses/libpdcurses.a
endif