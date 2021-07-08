# BATCH files made by LoadRNG.
> TESTED ON WINTOWS 10 20H2 for Aion Classic NA.

Download and extract the files anywere on your computer. The scripts will detect your isntall directory automatically. It doesn't need to be in the game directory. Then follow the instructions below.

> ALTERNATIVELY you can do the proccess manually by copying and pasting the "l10n" folder onto your game directory. Doing that it will activate the chat filter and the Japanese fonts. To use the Korean Combat voices, go to AION_CLASSIC\L10N\ENU\Sounds\ and rename the "voice" folder to "voiceNA". Done!

## AION CHAT FILTER:
__INSTALL:__
1. Run "Aion Classic Chat Filter.bat" as ADMIN;
2. It will ask if you wish to replace the existing file. Type "y" for YES (recomended) or "n" for NO;
3. If no error messages it will copy the filter file to the game directory;
4. Done.


## JAPANESE CRIT/PARRY/BLOCK FONTS:
![Preview](https://i.imgur.com/QYhucVk.png)
![Preview](https://i.imgur.com/geFLNsI.png)

> Block, Evade and Resist are the same as Parry.

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
1. Run "Aion Classic KR Combat Voices.bat" as ADMIN (yes, same file);
2. You should receive a message informing that the NA voice folder has been restored;
3. Done.
