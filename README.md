# GHCache

An example for implementing Flux architecture on Electron.
This implementation was [presented at the study meetup of Electron #1 on Apr. 24, 2015](https://speakerdeck.com/misumirize/being-flux-on-electron).

これはElectronにおけるFluxアーキテクチャの実装例である。
実装の具体的な手法については[2015年4月24日のElectron勉強会#1にて発表した](https://speakerdeck.com/misumirize/being-flux-on-electron)。

## Installation

```bash
$ npm install
```

## Usage

```bash
$ ./node_modules/electron-prebuilt/dist/Electron.app/Contents/MacOS/Electron .
```

Press `Ctrl+g` then type a GitHub repository (e.g. facebook/flux) and return key.
It will open a browser window and clone the repository in background.
You can see the cloned repository by clicking the local repositories list on the left pane.

`Ctrl+g`を押してフォームにGitHubリポジトリ（e.g. facebook/flux）を入力し、リターンキーを押す。
レンダラプロセスが立ち上がりGitHubを表示しながら、バックグラウンドで`git clone`が実行される。
cloneされたリポジトリは左側のローカルリポジトリリストをクリックすると確認できる。
