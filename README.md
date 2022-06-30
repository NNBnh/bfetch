<p align="center"><img width="100%" src="https://user-images.githubusercontent.com/43980777/107769286-5a11a980-6d6a-11eb-9d65-ed07bf79a5c0.png"></p>
<p align="center"><a href="https://github.com/NNBnh/bfetch/blob/main/LICENSE"><img src="https://img.shields.io/github/license/NNBnh/bfetch?labelColor=2A2734&color=DEAB63&style=for-the-badge" alt="License: GPL-3.0"></a> <a href="https://gist.github.com/NNBnh/9ef453aba3efce26046e0d3119dab5a7#development-completed"><img src="https://img.shields.io/badge/development-completed-%23DEAB63.svg?labelColor=2A2734&style=for-the-badge&logoColor=FFFFFF" alt="Development completed"></a></p>

## 💡 About
**SuperB Fetch** (a.k.a `bfetch`) is a *SuperB* general-purpose fetch displayer written in [`portable sh`](https://github.com/dylanaraps/pure-sh-bible) that takes user commands output and dynamically changes how it displays output based on the terminal size.

> *Check how people rice SuperB Fetch at [Bfetchporn](https://github.com/NNBnh/bfetch/discussions/1).*

<p align="center"><a href="https://asciinema.org/a/381349" target="_blank"><img src="https://asciinema.org/a/381349.svg"></a></p>

### 📔 Story
As a Linux ricer, I like to make [**Neofetch**](https://github.com/dylanaraps/neofetch) automatically run when the terminal starts.
This was fine until I switched to using a tiled window manager, the terminal is often too small leading to the fetch getting cropped off, even with [**Pfetch**](https://github.com/dylanaraps/pfetch), the problem would appear.
This has led me to create **SuperB Fetch**, a dynamic fetching tool the customization spirit of [**Ufetch**](https://gitlab.com/jschx/ufetch).

||[Neofetch](https://github.com/dylanaraps/neofetch)|[Pfetch](https://github.com/dylanaraps/pfetch)|
|:-:|-|-|
|Without SuperB Fetch|![Neofetch](https://user-images.githubusercontent.com/43980777/108312895-ef3cf400-71e9-11eb-8783-5d5d437c166a.png)|![Pfetch](https://user-images.githubusercontent.com/43980777/108312916-f532d500-71e9-11eb-9313-66363806bb4e.png)|
|With SuperB Fetch|![Bfetch](https://user-images.githubusercontent.com/43980777/108312905-f237e480-71e9-11eb-97db-4f2d0f5cdb8b.png)|![Bfetch](https://user-images.githubusercontent.com/43980777/108312925-f82dc580-71e9-11eb-97ab-1d9becab58dd.png)|

### ✨ Features
- Super **minimum** with exactly [**256** lines of `sh`](bin/bfetch#L256) and [**no dependencies**](#-dependencies) (if you don't count `sh`).
- Super **flexible**:
  - **Align/shift/change mode** contents based on terminal size.
  - **Hide** some elements if terminal is too small.
- Super **customizable**:
  - SuperB Fetch can **take commands output** and use it. By so, SuperB Fetch can display **anything** you want, **however** you want.
  - And even more [**config options**](#%EF%B8%8F-configuration)
- Have **two mode**:

|Paper mode|Classic mode|
|-|-|
|![Paper mode](https://user-images.githubusercontent.com/43980777/108312884-eba96d00-71e9-11eb-90f7-301537ba2000.png)|![Classic mode](https://user-images.githubusercontent.com/43980777/108312871-e64c2280-71e9-11eb-8569-f38765891480.png)|

## 🚀 Setup
### 🧾 Dependencies
- [Unix commands](https://en.wikipedia.org/wiki/List_of_Unix_commands) to process

### 📥 Installation
#### 🔧 Manually
Option 1: using `curl`
```sh
curl https://raw.githubusercontent.com/NNBnh/bfetch/main/bin/bfetch > ~/.local/bin/bfetch
chmod +x ~/.local/bin/bfetch
```

Option 2: using `git`
```sh
git clone https://github.com/NNBnh/bfetch.git ~/.local/share/bfetch
ln -s ~/.local/share/bfetch/bin/bfetch ~/.local/bin/bfetch
```

#### 📦 Package manager
For [Arch-Linux base distro](https://archlinux.org), install [this AUR package](https://aur.archlinux.org/packages/superbfetch-git):
```sh
paru -Sy superbfetch-git
```

For [Bpkg](https://github.com/bpkg/bpkg) user:
```sh
bpkg install NNBnh/bfetch
```

For [Basher](https://github.com/basherpm/basher) user:
```sh
basher install NNBnh/bfetch
```

> *If you can and want to port SuperB Fetch to other package managers, feel free to do so.*

## ⌨️ Usage
Run SuperB Fetch in the terminal:
```sh
bfetch
```

## ⚙️ Configuration
SuperB Fetch is configured through environment variables: `export BFETCH_<SETTING>="<value>"`
|Value|Valid|Default|Description|
|-|-|-|-|
|`BFETCH_INFO`|`<commands>`|`$XDG_CONFIG_HOME/bfetch/info` (`~/.config/bfetch/info`)|Read this commands output as infomation element (OS, WM, terminal, ...)|
|`BFETCH_ART`|`<commands>`|`$XDG_CONFIG_HOME/bfetch/art` (`~/.config/bfetch/art`)|Read this commands output as art element (operating system logo)|
|`BFETCH_COLOR`|`<commands>`|`$XDG_CONFIG_HOME/bfetch/color` (`~/.config/bfetch/color`)|Read this commands output as color element (colors strip below info)|
|||||
|`BFETCH_TEMPORARY`|`<path/to/file>`|`/tmp/bfetch`|Temporary file's location|
|||||
|`BFETCH_CLASSIC_MODE`|`true\|false`|`false`|Make SuperB Fetch prefer classic mode when both mode are possible|
|`BFETCH_ART_RIGHT`|`true\|false`|`false`|Render art on the right when using classic mode|
|`BFETCH_PADDING`|`0+`|`1`|Padding fetch when using classic mode|
|`BFETCH_SEPARATOR`|`0+`|`2`|Separate info and art when using classic mode|
|`BFETCH_PROMPT_HEIGHT`|`0+`|`1`|Acknowledge how high the shell prompt is and counter it so the prompt don't push the fetch out|

SuperB Fetch will export the maximum size that an element can get:
|Value|Description|
|-|-|
|`BFETCH_INFO_HEIGHT`|Maximum height of infomation element|
|`BFETCH_INFO_WIDTH`|Maximum width of infomation element|
|`BFETCH_ART_HEIGHT`|Maximum height of art element|
|`BFETCH_ART_WIDTH`|Maximum width of art element|
|`BFETCH_COLOR_HEIGHT`|Maximum height of color element|
|`BFETCH_COLOR_WIDTH`|Maximum width of color element|

### ℹ️ Info element
SuperB Fetch looking for and execute `$XDG_CONFIG_HOME/bfetch/info` for info element as default, you can copy [this info template](https://github.com/NNBnh/textart-collections/blob/7367d278ce41a38783d7ce12b3b05175836213cc/fetch/info.textart) with [Fetchutils](https://github.com/lptstr/fetchutils) as a starting point and customizing.

> *Make sure the file is executable*

### 🖼️ Art and color element
For art element and color element, take a look at [NNB's textart collections](https://github.com/NNBnh/textart-collections) and [other textart resources](https://github.com/NNBnh/textart-collections#-resources).

## 💌 Credits
Special thanks to:
- [**Julian Marcos**](https://github.com/Juliaria08) for porting this package to the [AUR](https://aur.archlinux.org/packages/superbfetch-git)
- [**Neofetch**](https://github.com/dylanaraps/neofetch) by [Dylan](https://github.com/dylanaraps)
- [**Pfetch**](https://github.com/dylanaraps/pfetch) also by [Dylan](https://github.com/dylanaraps)
- [**Ufetch**](https://gitlab.com/jschx/ufetch) by [Jschx](https://gitlab.com/jschx)
- [**Fetchutils**](https://github.com/lptstr/fetchutils) by [LPTSTR](https://github.com/lptstr)
- [**Pure sh bible**](https://github.com/dylanaraps/pure-sh-bible) also by [Dylan](https://github.com/dylanaraps)
- [**Carbon**](https://carbon.now.sh) by [@carbon_app](https://twitter.com/carbon_app)

<br><br><br><br>

---

> <h1 align="center">Made with ❤️ by <a href="https://github.com/NNBnh"><i>NNB</i></a></h1>
>
> <p align="center"><a href="https://www.buymeacoffee.com/nnbnh"><img src="https://img.shields.io/badge/buy_me_a_coffee%20-%23F7CA88.svg?logo=buy-me-a-coffee&logoColor=333333&style=for-the-badge" alt="Buy Me a Coffee"></a></p>
