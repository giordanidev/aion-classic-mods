# BATCH files made by LoadRPG.
Watch me on YouTube at [@LoadRPG](https://youtube.com/@LoadRPG) (PT-BR/EN) - If I ever start posting something there.

## Those scripts only work for CLASSIC NA and are no longer going to be maintained.
## Check my new app here: https://github.com/giordanidev/aion-classic-mods-py/releases/tag/v1.0.0

> TESTED ON WINDOWS 10 20H2-21H1 for Aion Classic NA.

Download and extract the files anywere on your computer. It doesn't need to be in the game directory. The scripts will detect your install directory automatically. Then follow the instructions below.

> ALTERNATIVELY you can do the proccess manually by copying and pasting the "l10n" folder onto your game directory. Doing that it will activate the chat filter and the Japanese fonts. To use the Korean Combat voices, go to AION_CLASSIC\L10N\ENU\Sounds\ and rename the "voice" folder to "voiceNA". Done!

## AION CHAT FILTER:
__INSTALL:__

- Install this file everytime there is a update. The launcher will always replace the file even if it's set to read only.

1. Close the game;
2. Run "Aion Classic Chat Filter.bat" as ADMIN;
3. If no error messages it will copy the filter file to the game directory;
4. Done.


## JAPANESE CRIT/PARRY/BLOCK/DODGE/RESIST FONTS:
![Crit Preview](https://i.imgur.com/QYhucVk.png)
![Parry/Block Preview](https://i.imgur.com/geFLNsI.png)
![Dodge/Blind Preview](https://i.imgur.com/HQc4W7p.png)

> Block is the same as Parry.
> Resist is the same as Dodge.

__INSTALL:__
1. Run "Aion Classic JP Fonts.bat" as ADMIN;
2. You should receive a message informing that the JP fonts have been installed (this process will copy the "hit_number.pak" file on this repository to the game directory);
3. Done.

__REMOVE:__
1. Run "Aion Classic JP Fonts.bat" as ADMIN (yes, same file);
2. You should receive a message informing that the NA fonts have been restored (this process will NOT delete the Japanese fonts but it will rename the JP fonts file as "hit_number.pak.JP");
3. Done.


## COMBAT VOICES:
__INSTALL ORIGINAL KOREAN COMBAT VOICES:__
- This proccess DOES NOT affect cutscene or NPC voices, only combat voices. What it does is it renames the NA "voice" folder making the client load the original Korean voice folder.

1. Run "Aion Classic KR Combat Voices.bat" as ADMIN;
2. You should receive a message informing that the voice folder has been renamed;
3. Done.

__RESTORE NA COMBAT VOICES:__
- Remember to run the .bat file before any maintenance to restore the NA voice folder, or else the launcher will redownload the voice folder (50mb~).

1. Run "Aion Classic KR Combat Voices.bat" as ADMIN (yes, same file);
2. You should receive a message informing that the NA voice folder has been restored;
3. Done.
