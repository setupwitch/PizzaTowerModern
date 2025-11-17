# THIS IS UNFINISHED, USE AT YOUR OWN RISK.

# Pizza Tower Modern
Basically rewriting half of the game.

## PULL REQUESTS WELCOME

# Dependencies
- [Pizza Tower release data file](https://store.steampowered.com/app/2231450/Pizza_Tower/)
- [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.8.2.0)
  The Steamworks SDK 1.61.
# How To Install

<details>
  <summary><h2>Project setup</h2></summary>

  Due to Pizza Tower costing money, I have created a script which should prevent anybody from compiling and playing this build without owning a copy themselves.

  (OPTIONAL) Disable `Real-time protection` in Windows Security, since this is going to copy a large amount of files it is heavily recommended.

  1. Download the 0.8.2.0 release build for [UndertaleModTool](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.8.2.0).

  2. Open the data.win file for Pizza Tower.

  <img src=".github/Guide1.png">

  <img src=".github/Guide2.png">

  3. Press the `Run other script...` button.

  <img src=".github/Guide3.png">

  4. Run `SpriteRipper.csx`, this will rip the sprites from the data.win file and add them to the GameMaker project.

  <img src=".github/Guide4.png">

  5. Select the `PizzaTower_GM2` project folder.

  <img src=".github/Guide5.png">
  
  6. Edit or remove the .gitignore file from the repository, this will allow you to commit the assets in git.
</details>

# Find an issue or inaccuracy?

Please [report](https://github.com/crystallizedsparkle/Pizza-Tower-EXtracted/issues/new/choose) it!
